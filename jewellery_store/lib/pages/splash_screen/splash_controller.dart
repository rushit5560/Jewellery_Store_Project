import 'dart:async';
import 'package:jewellery_store/pages/index_page/index_page.dart';
import 'package:jewellery_store/pages/onboarding_page/onboarding_page.dart';
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
      Get.off(IndexPage());
    }
    else/* if(onBoardingValue == false) */{
      Get.off(OnBoardingPage());
    }
  }


}