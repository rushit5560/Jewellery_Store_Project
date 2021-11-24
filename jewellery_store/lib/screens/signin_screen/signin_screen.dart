import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/common_widgets.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/common/image_url.dart';
import 'package:jewellery_store/controller/signin_screen_controller/signin_screen_controller.dart';
import 'package:jewellery_store/screens/signup_screen/signup_screen.dart';

class SignInScreen extends StatelessWidget {

  SignInScreenController signInScreenController = Get.put(SignInScreenController());

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        ()=> signInScreenController.isLoading.value
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
        : SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                logo(),
                SizedBox(height: 10),
                signInText(),
                SizedBox(height: 20),
                Form(
                  key: formkey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(
                      children: [
                        emailIdField(),
                        SizedBox(height: 10),
                        passwordField(),
                        SizedBox(height: 15),
                        rememberPass(),
                        SizedBox(height: 20),
                        loginButton(context),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                forgotPassword(),
                SizedBox(height: 25),
                signUpText(),
                SizedBox(height: 20),
                orText(),
                SizedBox(height: 25),
                socialButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget signInText() {
    return Text(
      "Sign In",
      style: TextStyle(
        color: CustomColor.kTealColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      // textScaleFactor: 1.5,
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
            )
        ),
      ),
      validator: (value) {
        if(value!.isEmpty){
          return "Password Should not be Empty";
        }
      },
    );
  }

  Widget rememberPass() {
    return Obx(
      ()=> Row(
        children: [
          Checkbox(
            activeColor: CustomColor.kTealColor,
            checkColor: Colors.white,
            value: signInScreenController.isChecked.value,
            onChanged: (bool? value) {
                signInScreenController.isChecked.value = value!;
                print(signInScreenController.isChecked.value);
            },
          ),
          Text('Remember Password?',
          style: TextStyle(
            decoration: TextDecoration.underline,
          ),),
        ],
      ),
    );
  }

  Widget loginButton(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      child: GestureDetector(
        onTap: () {
          if (formkey.currentState!.validate()) {
            print('${emailController.text.trim()}');
            print('${passwordController.text.trim()}');
            signInScreenController.getSignInData(
              emailController.text.trim().toLowerCase(),
                passwordController.text.trim(),
            );
          }
        },
        child: Container(
          width: deviceWidth,
          decoration: BoxDecoration(
              color: CustomColor.kTealColor,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Login',
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

  Widget forgotPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: GestureDetector(
        onTap: () {print('Clicked On Forgot Password?');},
        child: Text('Forgot Password?',
          style: TextStyle(
            decoration: TextDecoration.underline,
            // fontSize: 17
          ),),
      ),
    );
  }

  Widget signUpText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Not yet create account?'),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {
              Get.off(()=> SignUpScreen());
            },
            child: Text('Sign Up',
            style: TextStyle(
              decoration: TextDecoration.underline,
            ),),
          ),
        ],
      ),
    );
  }

  Widget orText() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Divider(
                thickness: 1,
                color: CustomColor.kTealColor,
                endIndent: 15,
                indent: 30,
              )),
          Text(
            'OR',
            style: TextStyle(color: Colors.white, fontSize: 17),
          ),
          Expanded(
              child: Divider(
                thickness: 1,
                color: CustomColor.kTealColor,
                indent: 15,
                endIndent: 30,
              )),
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
            onTap: () {print('Clicked On Facebook');},
            child: Image.asset(
              ImageUrl.facebook,
              fit: BoxFit.cover,
              width: 45,
              height: 45,
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {print('Clicked On Twitter');},
            child: Image.asset(
              ImageUrl.twitter,
              fit: BoxFit.cover,
              width: 45,
              height: 45,
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () {print('Clicked On Google');},
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
