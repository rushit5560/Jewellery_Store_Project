import 'dart:convert';
import 'package:get/get.dart';
import 'package:jewellery_store/common/api_url.dart';
import 'package:jewellery_store/models/collection_screen_model/collection_model.dart';
import 'package:http/http.dart' as http;

class CollectionScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  List<Datum> collectionLists = [];

  getCollectionData() async {
    isLoading(true);
    String url = ApiUrl.ProductApi;
    print('Url : $url');
    try{
      http.Response response = await http.get(Uri.parse(url));

      ProductData productData = ProductData.fromJson(json.decode(response.body));
      isStatus = productData.success.obs;

      if(isStatus.value) {
        collectionLists = productData.data;
      } else {
        print('Collection False False');
      }
    } catch(e) {
      print('Collection Error : $e');
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getCollectionData();
    super.onInit();
  }


}