import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/api_url.dart';
import 'package:jewellery_store/models/profile_screen_model/update_profile_screen_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ProfileScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  int? userId;

  updateUserProfile(name, country, state, city) async {
    isLoading(true);
    String url = ApiUrl.UpdateUserProfileApi;
    print('Url : $url');

    try{
      Map data = {
        "userid": "$userId",
        "name": "$name",
        "country": "$country",
        "state": "$state",
        "city": "$city"
      };
      print('data : $data');

      http.Response response = await http.post(
          Uri.parse(url),
          body: data,
      );
      print('Response : $response');
      UpdateUserProfileData updateUserProfileData = UpdateUserProfileData.fromJson(json.decode(response.body));
      print('updateUserProfileData : $updateUserProfileData');
      isStatus = updateUserProfileData.success.obs;
      print('isStatus : $isStatus');

      if(isStatus.value){
        Fluttertoast.showToast(msg: "${updateUserProfileData.message}");
        Get.back();
      } else {
        Fluttertoast.showToast(msg: "${updateUserProfileData.message}");
      }

    } catch(e){
      print('Update User Profile Error : $e');
    } finally {
      isLoading(false);
    }
  }


  getUserDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId = prefs.getInt('id');
    print('UserId Add to Cart : $userId');
  }

  @override
  void onInit() {
    getUserDetailsFromPrefs();
    super.onInit();
  }


}