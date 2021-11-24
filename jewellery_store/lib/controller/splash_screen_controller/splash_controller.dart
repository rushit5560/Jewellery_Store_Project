import 'dart:async';
import 'package:jewellery_store/screens/index_screen/index_screen.dart';
import 'package:jewellery_store/screens/onboarding_screen/onboarding_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  bool? onBoardingValue = false;


  @override
  void onInit() {
    super.onInit();
    print('Splash Controller Init Method');
    Timer(Duration(seconds: 3), () => getOnBoardingValue());
  }

  getOnBoardingValue() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    onBoardingValue = prefs.getBool("onboarding");
    print('Value : $onBoardingValue');

    if(onBoardingValue == true) {
      Get.off(()=> IndexScreen());
    }
    else/* if(onBoardingValue == false) */{
      Get.off(()=> OnBoardingScreen());
    }
  }


}