import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/common/image_url.dart';
import 'package:jewellery_store/screens/index_screen/index_screen.dart';

class OrderConfirmScreen extends StatelessWidget {
  const OrderConfirmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: Get.height * 0.35,
                width: Get.width * 0.50,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(ImageUrl.confirmation),
                    fit: BoxFit.cover,
                  )
                ),
              ),
              SizedBox(height: 10),
              Text(
                  'Order Successfully Placed!',
                style: TextStyle(
                  color: CustomColor.kTealColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 20),
              Text(
                  'Your Order has been successfully Placed and has been processed for Delivery.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16
                ),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Get.offAll(()=> IndexScreen());
                },
                child: Container(
                  width: Get.width * 0.45,
                  height: 40,
                  decoration: BoxDecoration(
                    color: CustomColor.kTealColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                        'Back To Home',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
