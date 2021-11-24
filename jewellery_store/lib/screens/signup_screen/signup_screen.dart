import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/common_functions.dart';
import 'package:jewellery_store/common/common_widgets.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/common/image_url.dart';
import 'package:jewellery_store/controller/signup_screen_controller/signup_screen_controller.dart';
import 'package:jewellery_store/screens/signin_screen/signin_screen.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreenController signUpScreenController =
      Get.put(SignUpScreenController());

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => CommonFunctions().hideKeyBoard(context),
      child: Scaffold(
        body: Obx(
          () => signUpScreenController.isLoading.value
              ? Container(
                  width: Get.width,
                  height: Get.height,
                  color: Colors.transparent,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: CustomColor.kTealColor,
                      backgroundColor: Colors.white,
                    ),
                  ),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        logo(), // Import From Common Widgets
                        SizedBox(height: 10),
                        signUpText(), // Import From Common Widgets
                        SizedBox(height: 20),
                        Form(
                          key: formkey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              children: [
                                userNameField(),
                                SizedBox(height: 10),
                                emailIdField(),
                                SizedBox(height: 10),
                                passwordField(),
                                SizedBox(height: 25),
                                signUpButton(context),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        signInText(),
                        SizedBox(height: 20),
                        orText(), // Import From Common Widgets
                        SizedBox(height: 25),
                        socialButton(),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }


  Widget userNameField() {
    return TextFormField(
      cursorColor: CustomColor.kTealColor,
      controller: userNameController,
      decoration: InputDecoration(
        hintText: "UserName",
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: CustomColor.kTealColor,
        )),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "UserName Should not be Empty";
        }
      },
    );
  }

  Widget emailIdField() {
    return TextFormField(
      cursorColor: CustomColor.kTealColor,
      controller: emailController,
      decoration: InputDecoration(
        hintText: "Email Id",
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: CustomColor.kTealColor,
        )),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Email Should not be Empty";
        }
        if (!value.contains('@')) {
          return 'Email should be Valid';
        }
      },
    );
  }

  Widget passwordField() {
    return TextFormField(
      cursorColor: CustomColor.kTealColor,
      obscureText: true,
      controller: passwordController,
      decoration: InputDecoration(
        hintText: "Password",
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
          color: CustomColor.kTealColor,
        )),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return "Password Should not be Empty";
        }
      },
    );
  }

  Widget signUpButton(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          if (formkey.currentState!.validate()) {
            print('${userNameController.text.trim()}');
            print('${emailController.text.trim()}');
            print('${passwordController.text.trim()}');
            signUpScreenController.getRegisterData(
                userNameController.text.trim(),
                emailController.text.trim().toLowerCase(),
                passwordController.text.trim(),
            );
          }
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: CustomColor.kTealColor,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              'Sign Up',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15),
            ),
          )),
        ),
      ),
    );
  }

  Widget signInText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Already Have account?'),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              Get.off(() => SignInScreen());
            },
            child: Text(
              'Sign In',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget socialButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              print('Clicked On Facebook');
            },
            child: Image.asset(
              ImageUrl.facebook,
              fit: BoxFit.cover,
              width: 45,
              height: 45,
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              print('Clicked On Twitter');
            },
            child: Image.asset(
              ImageUrl.twitter,
              fit: BoxFit.cover,
              width: 45,
              height: 45,
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              print('Clicked On Google');
            },
            child: Image.asset(
              ImageUrl.google,
              fit: BoxFit.cover,
              width: 45,
              height: 45,
            ),
          ),
        ],
      ),
    );
  }
}
