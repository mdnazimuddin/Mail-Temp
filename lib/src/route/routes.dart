import 'package:get/get.dart';
import 'package:mailtemp/src/features/splash/SplashScreen.dart';

class RouteClass {
  /*
  * route veriables
  */
  static String splash = '/';

  /*
  * get routes
  */
  static String getSplashRoute() => splash;

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
  ];
}
