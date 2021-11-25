import 'dart:convert';

import 'package:get/get.dart';
import 'package:jewellery_store/common/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:jewellery_store/models/cart_screen_model/add_cart_qty.dart';
import 'package:jewellery_store/models/cart_screen_model/cart_model.dart';
import 'package:jewellery_store/models/cart_screen_model/delete_cart_product_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxList<Cartditeil> userCartProductLists = RxList();
  RxInt userCartTotalAmount = 0.obs;
  RxInt userCartId = 0.obs;

  getUserCartData(userId) async {
    isLoading(true);
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
        userCartProductLists = userCartData.data.cartditeil.obs;
        userCartTotalAmount = userCartData.data.cart.totalprice.obs;
        userCartId = userCartData.data.cart.cartId.obs;
        print("userCartProductLists : $userCartProductLists");
      } else {
        print('User Cart False');
      }
    } catch(e) {
      print('User Cart Data Error : $e');
    } finally {
      isLoading(false);
    }
  }

  getAddProductCartQty(quantity, cartDetailId) async {
    isLoading(true);
    String url = ApiUrl.AddCartQtyApi;
    print('Url : $url');

    try{
      Map data = {
        "qty": "$quantity",
        "cid": "$cartDetailId"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);
      AddCartQtyData addCartQtyData = AddCartQtyData.fromJson(json.decode(response.body));
      isStatus = addCartQtyData.success.obs;

      if(isStatus.value){
        Get.snackbar(addCartQtyData.message, '');
      } else {
        print('Add Qty False');
      }
    } catch(e) {
      print('Add Product Qty Error : $e');
    } finally {
      isLoading(false);
    }
  }

  getDeleteProductCart(cartDetailId) async {
    isLoading(true);
    String url = ApiUrl.DeleteCartProductApi;
    print('Url : $url');

    try {
      Map data = {"id": "$cartDetailId"};
      http.Response response = await http.post(Uri.parse(url), body: data);
      DeleteCartProductData deleteCartProductData =
          DeleteCartProductData.fromJson(json.decode(response.body));
      isStatus = deleteCartProductData.success.obs;
      if (isStatus.value) {
        Get.snackbar('Successfully Deleted Cart Item', '');
      } else {
        print('DeleteCartProductData False False');
      }
    } catch (e) {
      print('DeleteCartProductData Error : $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getUserDetailsFromPrefs();
    super.onInit();
  }

  getUserDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId1 = prefs.getInt('id');
    print('UserId Add to Cart : $userId1');
    getUserCartData(userId1);
  }
}