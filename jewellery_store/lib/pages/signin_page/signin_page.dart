import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/common/image_url.dart';
import 'package:jewellery_store/pages/signup_page/signup_page.dart';

class SignInPage extends StatefulWidget {

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      userNameField(),
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
    );
  }

  Widget logo() {
    return Container(
      height: 150, width: 150,
      child: Image.asset(ImageUrl.logo),
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

  Widget userNameField() {
    return TextFormField(
      cursorColor: CustomColor.kTealColor,
      keyboardType: TextInputType.emailAddress,
      controller: userNameController,
      decoration: InputDecoration(
        hintText: "UserName",
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: CustomColor.kTealColor,
          ),
        ),
      ),
      validator: (value) {
        if(value!.isEmpty){
          return "UserName Should not be Empty";
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

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Row(
            children: [
              Checkbox(
                activeColor: CustomColor.kTealColor,
                checkColor: Colors.white,
                value: isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isChecked = value!;
                    print(isChecked);
                  });
                },
              ),
              Text('Remember Password?',
              style: TextStyle(
                decoration: TextDecoration.underline,
              ),),
            ],
          ),
        ),

      ],
    );
  }

  Widget loginButton(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      child: GestureDetector(
        onTap: () {
          if (formkey.currentState!.validate()) {
            print('Inside formkey');
            print('${userNameController.text.trim()}');
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
              Get.off(SignUpPage());
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
