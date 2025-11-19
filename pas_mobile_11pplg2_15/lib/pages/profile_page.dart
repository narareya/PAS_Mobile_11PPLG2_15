import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_15/controller/auth_controller.dart';
import 'package:pas_mobile_11pplg2_15/routes/routes.dart';
import 'package:pas_mobile_11pplg2_15/widget/widget_components.dart';

class ProfilePage extends StatelessWidget {
  final authController = Get.find<AuthController>();
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile User")),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 60,

            ),
            const SizedBox(height: 20),
            Text(
                "Esta Janitra Lituhayu",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            
              const SizedBox(height: 8),

            //   // Email / Bio
            Text(
                "est4j4.esta@gmail.com",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              
              const SizedBox(height: 30),


              CustomButton(
                onPressed: () {
                  Get.defaultDialog(
                    title: "Konfirmasi Logout",
                    middleText: "Apakah kamu yakin ingin logout?",
                    textConfirm: "Ya",
                    textCancel: "Tidak",
                    confirmTextColor: Colors.white,
                    onConfirm: () {
                      // authController.signOut();
                      authController.logout();// Tutup dialog setelah logout
                    },
                    onCancel: () {},
                  );
                }, label: "Logout")
          ],
        )
        
      ),
    );
  }
}