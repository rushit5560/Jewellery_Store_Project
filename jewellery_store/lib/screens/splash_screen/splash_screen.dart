import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/image_url.dart';

import '../../controller/splash_screen_controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {

  final splashController = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    print('Splash Screen On');
    return Scaffold(
      body: Image.asset(
        ImageUrl.splash,
        fit: BoxFit.cover,
        height: Get.height,
      ),
    );
  }
}
