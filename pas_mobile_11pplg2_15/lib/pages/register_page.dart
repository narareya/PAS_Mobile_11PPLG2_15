import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_15/controller/auth_controller.dart';
import 'package:pas_mobile_11pplg2_15/routes/routes.dart';
import 'package:pas_mobile_11pplg2_15/widget/widget_components.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register Page"),),
      body: Center(
        child: Column(
          children: [
            CustomInput(input: "Username", controller: authController.usernameController, isPassword: false),
            CustomInput(input: "Fullname", controller: authController.nameController, isPassword: false),
            CustomInput(input: "Email", controller: authController.emailController, isPassword: false),
            CustomInput(input: "Password", controller: authController.passwordController, isPassword: true),
            CustomButton(onPressed: () {
              authController.register();
            }, label: "Register")
          ],
        ),
      ),
    );
  }
}