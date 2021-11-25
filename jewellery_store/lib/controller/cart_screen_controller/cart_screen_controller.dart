import 'dart:convert';

import 'package:get/get.dart';
import 'package:jewellery_store/common/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:jewellery_store/models/cart_screen_model/cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<Cartditeil> userCartProductLists = RxList();

  getUserCartData(userId) async {
    String url = ApiUrl.UserCartApi;
    print('Url : $url');

    try{
      Map data = {
        "user_id" : "$userId"
      };
      http.Response response = await http.post(Uri.parse(url),body: data);
      UserCartData userCartData = UserCartData.fromJson(json.decode(response.body));
      isStatus = userCartData.success.obs;

      if(isStatus.value) {
        userCartProductLists.clear();
      }
    } catch(e) {
      print('User Cart Data Error : $e');
    }
  }

  getUserDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId1 = prefs.getInt('id');
    print('UserId Add to Cart : $userId1');
    getUserCartData(userId1);
  }

  @override
  void onInit() {
    getUserDetailsFromPrefs();
    super.onInit();
  }
}