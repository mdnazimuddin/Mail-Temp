import 'package:get/get.dart';
import 'package:mailtemp/src/features/home/HomeScreen.dart';
import 'package:mailtemp/src/features/mail/MailScreen.dart';
import 'package:mailtemp/src/features/mail/components/MailDetailsScreen.dart';
import 'package:mailtemp/src/features/splash/SplashScreen.dart';

class RouteClass {
  /*
  * route veriables
  */
  static String splash = '/';
  static String home = '/home';
  static String mail = '/mail';
  static String mailDelails = '/mailDelails';

  /*
  * get routes
  */
  static String getSplashRoute() => splash;
  static String getHomeRoute() => home;
  static String getMailRoute() => mail;
  static String getMailDetailsRoute() => mailDelails;

  static List<GetPage> routes = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: mail,
      page: () => const MailScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(seconds: 1),
    ),
    GetPage(
      name: mailDelails,
      page: () => MailDetailsScreen(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(seconds: 1),
    ),
  ];
}
