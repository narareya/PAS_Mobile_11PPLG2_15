import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_15/controller/auth_controller.dart';
import 'package:pas_mobile_11pplg2_15/routes/pages.dart';
import 'package:pas_mobile_11pplg2_15/routes/routes.dart';
import 'package:pas_mobile_11pplg2_15/widget/widget_components.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("LoginPage"),),
      body: Center(
        child: Column(
          children: [
            CustomInput(input: "Username", controller: authController.usernameController, isPassword: false),
            CustomInput(input: "Password", controller: authController.passwordController, isPassword: true),
            CustomButton(onPressed: () {
              authController.login();
            }, label: "Login"),

            SizedBox(height: 15,),

            CustomButton(onPressed: () {
              Get.toNamed(AppRoutes.registerPage);
            }, label: "Register")
          ],
        ),
      ),
    );
  }
}