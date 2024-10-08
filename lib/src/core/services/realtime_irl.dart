import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_foreground_task/flutter_foreground_task.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:irllink/src/core/resources/data_state.dart';
import 'package:irllink/src/core/utils/determine_position.dart';
import 'package:irllink/src/core/utils/globals.dart' as globals;
import 'package:irllink/src/core/utils/init_dio.dart';

enum RtIrlStatus {
  updating,
  stopped,
}

class RealtimeIrl {
  String key;

  Rx<RtIrlStatus> status = RtIrlStatus.stopped.obs;

  RealtimeIrl(
    this.key,
  );

  Future<void> onReceiveTaskData(dynamic data) async {
    if (data is Map<String, dynamic>) {
      final dynamic action = data["action"];
      switch (action) {
        case 'repeat':
          status.value = RtIrlStatus.updating;
          DataState<Position> p = await determinePosition();
          if (p is DataSuccess && status.value == RtIrlStatus.updating) {
            globals.talker?.info(
              "Updating position on RTIRL: ${p.data!.latitude}, ${p.data!.longitude} at ${data['timestampMillis']}",
            );
            DataState updateResult = await updatePosition(p.data!);
            if (updateResult is DataFailed) {
              status.value = RtIrlStatus.stopped;
              await stopTracking();
            }
          }
          break;
        case 'rtirl_stop':
          await stopTracking();
          break;
        default:
          globals.talker?.info("Unknown action: $action");
      }
    }
  }

  Future<DataState> updatePosition(Position p) async {
    try {
      Response response;
      Dio dio = initDio();
      dio.options.headers["Content-Type"] = "application/json";
      response = await dio.post(
        "https://rtirl.com/api/push?key=$key",
        data: {
          'latitude': p.latitude,
          'longitude': p.longitude,
        },
      );
      status.value = RtIrlStatus.updating;
      return DataSuccess(response.data);
    } on DioException catch (e) {
      status.value = RtIrlStatus.stopped;
      return DataFailed(
        "Unable to update your position on RTIRL : ${e.message}",
      );
    }
  }

  Future<DataState> stopTracking() async {
    try {
      FlutterForegroundTask.stopService();
      Response response;
      Dio dio = initDio();
      status.value = RtIrlStatus.stopped;
      response = await dio.post(
        "https://rtirl.com/api/stop?key=$key",
      );
      return DataSuccess(response.data);
    } on DioException catch (e) {
      return DataFailed(
        "Unable to stop tracking your position on RTIRL : ${e.message}",
      );
    }
  }
}
