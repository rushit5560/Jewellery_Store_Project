import 'package:flutter/material.dart';
import 'custom_color.dart';
import 'image_url.dart';

Widget logo() {
  return Container(
    height: 150,
    width: 150,
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