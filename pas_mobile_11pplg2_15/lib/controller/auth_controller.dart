import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_15/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController extends GetxController {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final emailController = TextEditingController();

  var isLoading = false.obs;

  Future<void> register() async {
    isLoading.value = true;
    var url = Uri.parse('https://mediadwi.com/api/latihan/register-user');
    var response = await http.post( url, 
    body: {
      'username' : usernameController.text,
      'password' : passwordController.text,
      'full_name' : nameController.text,
      'email' : emailController.text,
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

    try {
      var url = Uri.parse('https://mediadwi.com/api/latihan/login');
      var response = await http.post( url, 
        body: {
          'username' : usernameController.text,
          'password' : passwordController.text,
        }
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      final data = json.decode(response.body);

      if (response.statusCode == 200) {
        // API mengembalikan token {"token": "adminblablala"}
        final token = data['token'];

        // simpan token ke sharedpref
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);

        // snackbar notification
        Get.snackbar(
          'Login Berhasil', 'Token berhasil disimpan',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,);
          print('username : '+ usernameController.text);
          print('password : '+ passwordController.text);
        Get.offAllNamed(AppRoutes.mainPage);
      } else {
        // ambil pesan error dari server
        Get.snackbar(
          'Login Gagal',
          data['message']?.toString() ?? 'Terjadi kesalahan',
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
    await prefs.remove("username");
    Get.offAllNamed(AppRoutes.loginPage);
  }
}