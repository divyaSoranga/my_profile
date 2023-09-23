import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_profile1/routes/routes.dart';


import '../modules/homescreen/home_screen.dart';
import '../modules/loginscreen/login_screen.dart';

class Pages {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.LoginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.HomeScreen,
      page: () => HomeScreen(),
    ),
  ];
}
