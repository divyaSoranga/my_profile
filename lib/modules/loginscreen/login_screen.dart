import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../../routes/routes.dart';
import '../../utils/app_validation.dart';
import 'google_service.dart';
import 'login_screen_ctrl.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final c = Get.put(LoginController());
  // final c = Get.put(LoginController());

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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Login Page'),
        ),
        body: Form(
          key: c.formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: c.emailController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (p0) => AppValidation.email(c.emailController.text),
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
                obscureText: true,
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
              ElevatedButton(
                onPressed: () {
                  if (c.formkey.currentState!.validate()) {}
                  // Implement your login logic here
                  String email = c.emailController.text;
                  String password = c.passwordController.text;
                },
                child: Text('Login'),
              ),
              // Add Google Sign-In button
              ElevatedButton(
                onPressed: () {
                  InitService.googleSingIn();
                  Get.toNamed(Routes.HomeScreen);
                  // Implement Google Sign-In logic here
                },
                child: Text('Sign in with Google'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
