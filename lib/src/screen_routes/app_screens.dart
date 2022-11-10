import 'package:get/get.dart';
import 'package:greengrocer/src/screens/auth/sign_in_screen.dart';
import 'package:greengrocer/src/screens/auth/sign_up_screen.dart';
import 'package:greengrocer/src/screens/base/base_screen.dart';
import 'package:greengrocer/src/screens/splash/splash_screen.dart';

abstract class AppScreens {
  static final screens = <GetPage>[
    GetPage(
      name: ScreensRoutes.splashRoute,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: ScreensRoutes.signInRoute,
      page: () => SingnInScreen(),
    ),
    GetPage(
      name: ScreensRoutes.signUpRoute,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: ScreensRoutes.baseRoute,
      page: () => const BaseScreen(),
    ),
  ];
}

abstract class ScreensRoutes {
  static const String splashRoute = "/splash";
  static const String signInRoute = "/signin";
  static const String signUpRoute = "/signup";
  static const String baseRoute = "/";
}
