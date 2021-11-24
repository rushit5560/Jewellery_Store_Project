import 'dart:convert';

import 'package:get/get.dart';
import 'package:jewellery_store/common/api_url.dart';
import 'package:jewellery_store/models/home_screen_model/banner_model.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;

  RxInt activeIndex = 0.obs;
  RxList<Datum> bannerLists = RxList();


  getBannerData() async {
    isLoading(true);
    String url = ApiUrl.BannerApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      BannerData bannerList = BannerData.fromJson(json.decode(response.body));
      isStatus = bannerList.success.obs;

      if(isStatus.value){
        bannerLists = bannerList.data.obs;
      } else {
        print('Banner False False');
      }
    } catch(e) {
      print('Banner Error : $e');
    } finally {
      isLoading(false);
    }
  }


  @override
  void onInit() {
    getBannerData();
    super.onInit();
  }
}