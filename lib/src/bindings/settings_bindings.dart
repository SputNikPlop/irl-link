import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:irllink/src/data/repositories/settings_repository_impl.dart';
import 'package:irllink/src/data/repositories/streamelements_repository_impl.dart';
import 'package:irllink/src/data/repositories/twitch_repository_impl.dart';
import 'package:irllink/src/domain/usecases/settings_usecase.dart';
import 'package:irllink/src/domain/usecases/streamelements_usecase.dart';
import 'package:irllink/src/domain/usecases/twitch_usecase.dart';
import 'package:irllink/src/presentation/controllers/settings_view_controller.dart';
import 'package:irllink/src/presentation/events/settings_events.dart';
import 'package:irllink/src/presentation/events/streamelements_events.dart';

class SettingsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsViewController>(
      () => SettingsViewController(
          settingsEvents: SettingsEvents(
            settingsUseCase: SettingsUseCase(
              settingsRepository: SettingsRepositoryImpl(),
            ),
            twitchUseCase: TwitchUseCase(
              twitchRepository: TwitchRepositoryImpl(),
            ),
          ),
          streamelementsEvents: StreamelementsEvents(
            streamelementsUseCase: StreamelementsUseCase(
              streamelementsRepository: StreamelementsRepositoryImpl(),
            ),
            settingsUseCase: SettingsUseCase(
              settingsRepository: SettingsRepositoryImpl(),
            ),
          )),
    );
  }
}
