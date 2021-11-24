import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/image_url.dart';
import 'package:jewellery_store/screens/index_screen/index_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/onboarding_screen_model/onboarding_model.dart';

class OnBoardingController extends GetxController {
  var selectedPageIndex = 0.obs;
  var pageController = PageController();
  bool get isLastPage => selectedPageIndex.value == onBoardingPages.length - 1;


  forwardAction() {
    if(isLastPage){
      setOnBoardingValue();
      Get.off(()=> IndexScreen());
    } else {
      pageController.nextPage(duration: 300.milliseconds, curve: Curves.ease);
    }
  }


  List<OnBoardingInfo> onBoardingPages= [
    OnBoardingInfo(
      imageAsset: ImageUrl.service1,
      title: 'Modern Jewellery',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing slit. Morbi dapibus, sem vel dapibus pellentesque, tellus lectus',
    ),
    OnBoardingInfo(
      imageAsset: ImageUrl.service2,
      title: 'Pure Gold',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing slit. Morbi dapibus, sem vel dapibus pellentesque, tellus lectus',
    ),
    OnBoardingInfo(
      imageAsset: ImageUrl.service3,
      title: 'Diamond Jewellery',
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing slit. Morbi dapibus, sem vel dapibus pellentesque, tellus lectus',
    ),
  ];

  setOnBoardingValue() async {
    print('Call Set Value Method');
    SharedPreferences  prefs = await SharedPreferences.getInstance();
    prefs.setBool("onboarding", true);
    print('Set Value : ${prefs.getBool("onboarding")}');
  }

}