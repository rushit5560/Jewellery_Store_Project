import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/api_url.dart';
import 'package:jewellery_store/models/change_password_screen_model/change_password_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class ChangePasswordScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  int? userId;

  getForgotPasswordData(oldPass, newPass, cNewPass) async {
    isLoading(true);
    String url = ApiUrl.ChangePasswordApi;
    print('Url : $url');

    try{
      Map data = {
        "id": "$userId",
        "oldpassword": "$oldPass",
        "password": "$newPass",
        "password_confirmation": "$cNewPass"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);

      ChangePasswordData changePasswordData = ChangePasswordData.fromJson(json.decode(response.body));
      isStatus = changePasswordData.success.obs;

      if(isStatus.value){
        Fluttertoast.showToast(msg: "Password Change Successfully.");
        Get.back();
      } else {
        Fluttertoast.showToast(msg: "${changePasswordData.message}");
      }
    } catch(e) {
      print('Change Pass Error : $e');
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