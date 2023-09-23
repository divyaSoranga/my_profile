import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:my_profile/src/navagation/routes.dart';

import '../modules/homescreen/home_screen.dart';
import '../modules/loginscreen/edit_profile.dart';
import '../modules/loginscreen/login_screen.dart';

class Pages {
  static List<GetPage> pages = [
    GetPage(
      name: Routes.LoginScreen,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.UserProfilePage,
      page: () => UserProfilePage(),
    ),
    GetPage(
      name: Routes.HomeScreen,
      page: () => HomeScreen(),
    ),
  ];
}
