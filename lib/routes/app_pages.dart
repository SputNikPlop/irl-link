import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:irllink/src/bindings/home_bindings.dart';
import 'package:irllink/src/bindings/login_bindings.dart';
import 'package:irllink/src/bindings/settings_bindings.dart';
import 'package:irllink/src/presentation/views/home_view.dart';
import 'package:irllink/src/presentation/views/login_view.dart';
import 'package:irllink/src/presentation/views/settings_view.dart';

import 'app_routes.dart';

class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginView(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeView(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: Routes.settings,
      page: () => SettingsView(),
      binding: SettingsBindings(),
    ),
  ];
}
