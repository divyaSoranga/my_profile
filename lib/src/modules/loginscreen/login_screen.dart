import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:my_profile/src/utils/app_validation.dart';

import '../../navagation/routes.dart';
import '../../utils/widgets/app_textfield.dart';
import 'google_service.dart';
import 'loginscreen_ctrl.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final c = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF068BB7),
            Color(0xFF004257),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // appBar: AppBar(
        //   backgroundColor: Colors.transparent,
        //   title:,
        // ),
        body: Form(
          key: c.formkey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Login Page',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ).paddingSymmetric(vertical: 50),
                  TextFormField(
                    controller: c.emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (p0) =>
                        AppValidation.email(c.emailController.text),
                    decoration: InputDecoration(
                      labelText: 'email',
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 15, vertical: 10),
                  TextFormField(
                    controller: c.passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (p0) =>
                        AppValidation.password(c.passwordController.text),
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    // obscureText: true,
                  ).paddingSymmetric(horizontal: 15, vertical: 10),

                  Row(
                    children: <Widget>[
                      Obx(
                        () => Checkbox(
                          value: c.rememberMe.value,
                          onChanged: (newValue) {
                            c.rememberMe.value = newValue!;
                          },
                        ),
                      ),
                      const Text('Remember Me'),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.10),
                  SizedBox(
                    width: 150,
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        if (c.formkey.currentState!.validate()) {
                          c.login(context);
                          Get.toNamed(Routes.HomeScreen);
                        }
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),

                  // Add Google Sign-In button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    onPressed: () async {
                      await InitService.googleSingIn();
                      // Implement Google Sign-In logic here
                    },
                    child: const Text('Sign in with Google',
                        style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
