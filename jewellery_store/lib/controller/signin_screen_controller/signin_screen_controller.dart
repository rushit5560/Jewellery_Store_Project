import 'package:get/get.dart';
import 'package:jewellery_store/common/api_url.dart';
import 'package:http/http.dart' as http;
import 'package:jewellery_store/common/common_functions.dart';
import 'package:jewellery_store/models/signin_screen_model/signin_model.dart';
import 'package:jewellery_store/screens/index_screen/index_screen.dart';

class SignInScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isStatus = false.obs;
  RxBool isChecked = false.obs;

  getSignInData(String email, String password) async {
    isLoading(true);
    String url = ApiUrl.LoginApi;
    print("Url : $url");

    try{
      Map data = {"email": "$email", "password": "$password"};
      print('data : $data');

      http.Response response = await http.post(Uri.parse(url), body: data);

      // When User SignIn Failed
      if (response.body.contains('Email')) {
        print('Email Don\'t Match');
        Get.snackbar('', 'Email Don\'t Match');
      }
      if(response.body.contains('password')) {
        print('Password Don\'t Match');
        Get.snackbar('', 'Password Don\'t Match');
      } //

      SignInData signInData = signInDataFromJson(response.body);
      isStatus = signInData.success.obs;

      if(isStatus.value){
        var id = signInData.data.id;
        var token = signInData.data.token;
        print('id : $id \nToken : $token');
        CommonFunctions().setUserDetailsInPrefs(id, token);
        Get.offAll(() => IndexScreen());
        Get.snackbar('User Login In Successfully.','');
      } else {
        print('SignIn False');
      }
    } catch(e) {
      print('Sign In Error : $e');
    } finally {
      isLoading(false);
    }
  }
}