import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:jewellery_store/models/contact_us_screen_model/contact_us_model.dart';

class ContactUsScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;

  getContactUsData(String fullName, String emailId, String phoneNo, String subject, String comment) async {
    isLoading(true);
    String url = ApiUrl.ContactUsApi;
    print('Url : $url');

    try{
      Map data = {
        "name": "$fullName",
        "email": "$emailId",
        "subject": "$subject",
        "message": "$comment",
        "phone": "$phoneNo"
      };
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);

      ContactUsData contactUsData = ContactUsData.fromJson(json.decode(response.body));
      isStatus = contactUsData.success.obs;

      if(isStatus.value){
        Fluttertoast.showToast(msg: "${contactUsData.message.toString()}");
        // Get.back();
      } else {
        print('Contact Us False');
      }
    } catch(e){
      print('Contact Us Error : $e');
    } finally {
      isLoading(false);
    }
  }
}