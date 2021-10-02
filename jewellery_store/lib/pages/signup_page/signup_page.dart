import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/common/image_url.dart';
import 'package:jewellery_store/pages/signin_page/signin_page.dart';

class SignUpPage extends StatelessWidget {


  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              logo(),
              SizedBox(height: 10),
              signUpText(),
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
              orText(),
              SizedBox(height: 25),
              socialButton(),
            ],
          ),
        ),
      ),
    );
  }
  Widget logo() {
    return Container(
      height: 150, width: 150,
      child: Image.asset(ImageUrl.logo),
    );
  }

  Widget signUpText() {
    return Text(
      "Sign Up",
      style: TextStyle(
        color: CustomColor.kTealColor,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      // textScaleFactor: 1.5,
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
            )
        ),
      ),
      validator: (value) {
        if(value!.isEmpty){
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
            )
        ),
      ),
      validator: (value) {
        if(value!.isEmpty){
          return "Email Should not be Empty";
        }
        if(!value.contains('@')){
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

  Widget signUpButton(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      child: GestureDetector(
        onTap: () {
          if (formkey.currentState!.validate()) {
            print('Inside formkey');
            print('${userNameController.text.trim()}');
            print('${emailController.text.trim()}');
            print('${passwordController.text.trim()}');
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
              Get.off(SignInPage());
            },
            child: Text('Sign In',
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
