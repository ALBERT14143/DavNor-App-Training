import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please Wait...',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 16),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
