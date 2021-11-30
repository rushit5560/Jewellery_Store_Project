import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/screens/splash_screen/splash_screen.dart';
import 'package:jewellery_store/zzz_extra_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Jewellery Store",
      debugShowCheckedModeBanner: false,

      theme: ThemeData.dark().copyWith(
        primaryColor: CustomColor.kTealColor,
        dialogBackgroundColor: Colors.white,
        radioTheme: RadioThemeData(
          fillColor: MaterialStateProperty.resolveWith((states) => CustomColor.kTealColor),
          visualDensity: VisualDensity.comfortable,

        ),
        navigationRailTheme: NavigationRailThemeData(
          backgroundColor: CustomColor.kTealColor,
        ),
      ),

      home: ExtraScreen(),
    );
  }
}
