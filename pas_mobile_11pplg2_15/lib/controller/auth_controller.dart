import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_15/model/login_model.dart';
import 'package:pas_mobile_11pplg2_15/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  var isLoading = false.obs;
  

  Future<void> register() async {
    final username = usernameController.text.toString();
    final password = passwordController.text.toString();
    final fullName = nameController.text.toString();
    final email = emailController.text.toString();

    
    isLoading.value = true;
    var url = Uri.parse('https://mediadwi.com/api/latihan/register-user');
    var response = await http.post( url, 
    body: {
      'username' : username,
      'password' : password,
      'full_name' : fullName,
      'email' : email,
    }
  );
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');


      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        Get.snackbar(
          'Register Berhasil', 'Kembali ke Login',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,);
        Get.offAllNamed(AppRoutes.loginPage);
      }
  }

  Future<void> login() async {
    isLoading.value = true;
    
    final username = usernameController.text.toString();
    final password = passwordController.text.toString();
    
    try {
      var url = Uri.parse('https://mediadwi.com/api/latihan/login');
      var response = await http.post( url, 
        body: {
          'username' : username,
          'password' : password,
        }
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final loginResponse = loginModelFromJson(response.body);
      
        // snackbar notification
        Get.snackbar(
          loginResponse.status ? "Sukses" : "Gagal",
          loginResponse.message,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,);

          if (loginResponse.status && loginResponse.token.isNotEmpty) {
            final prefs = await SharedPreferences.getInstance();
            await prefs.setString("token", loginResponse.token);

            Get.offAllNamed(AppRoutes.mainPage);
          }
      } else {
        // ambil pesan error dari server
        Get.snackbar(
          'Error',
          "Server Error: ${response.statusCode}",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(),
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    Get.offAllNamed(AppRoutes.loginPage);
  }
}