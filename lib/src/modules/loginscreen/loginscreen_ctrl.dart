import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_profile/src/navagation/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../homescreen/home_screen.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool rememberMe = false.obs;
  RxBool isValidate = false.obs;

  @override
  void onInit() {
    loadSavedCredentials();

    super.onInit();
  }

  OutlineInputBorder get border {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(11)),
        borderSide: BorderSide(color: Color(0xFFFC8233)));
  }

  loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('rememberMe') ?? false) {
      emailController.text = prefs.getString('username') ?? '';
      passwordController.text = prefs.getString('password') ?? '';
      rememberMe(true);
    }
  }

  saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (rememberMe.value) {
      prefs.setString('Email', emailController.text);
      prefs.setString('password', passwordController.text);
      prefs.setBool('rememberMe', true);
    } else {
      prefs.remove('Email');
      prefs.remove('password');
      prefs.remove('rememberMe');
    }
  }

  Future<void> login(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => HomeScreen()), // Navigate to the Home Page
      );
      Get.toNamed(Routes.HomeScreen);
      // Navigate to the next screen or perform other actions after successful login.
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided.');
      }
    }
  }

  // Future<void> _confirmDiscardChanges(BuildContext context) async {
  //   if (_user.name != _originalName) {
  //     final confirm = await showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text('Discard Changes?'),
  //           content: Text('You have unsaved changes. Do you want to discard them?'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop(true); // Discard changes
  //               },
  //               child: Text('Discard'),
  //             ),
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.of(context).pop(false); // Stay on the page
  //               },
  //               child: Text('Cancel'),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //
  //     if (confirm == true) {
  //       Navigator.of(context).pop(); // Navigate back
  //     }
  //   } else {
  //     Navigator.of(context).pop(); // No unsaved changes, simply navigate back
  //   }
  // }
}
