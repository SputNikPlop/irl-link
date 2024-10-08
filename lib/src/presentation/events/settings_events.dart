import 'package:irllink/src/core/resources/data_state.dart';
import 'package:irllink/src/domain/entities/settings.dart';
import 'package:irllink/src/domain/entities/twitch/twitch_user.dart';
import 'package:irllink/src/domain/usecases/settings_usecase.dart';
import 'package:irllink/src/domain/usecases/twitch_usecase.dart';

class SettingsEvents {
  final SettingsUseCase settingsUseCase;
  final TwitchUseCase twitchUseCase;
  SettingsEvents({required this.twitchUseCase, required this.settingsUseCase});

  Future<DataState<Settings>> getSettings() {
    return settingsUseCase.getSettings();
  }

  Future<void> setSettings({required Settings settings}) {
    return settingsUseCase.setSettings(settings: settings);
  }

  Future<DataState<List<TwitchUser>>> getTwitchUsers(
      {required List ids, required String accessToken}) {
    return twitchUseCase.getTwitchUsers(ids: ids, accessToken: accessToken);
  }

  Future<DataState<String>> logout({required String accessToken}) {
    return twitchUseCase.logout(accessToken: accessToken);
  }
}
