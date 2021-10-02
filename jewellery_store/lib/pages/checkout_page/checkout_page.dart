import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/common/image_url.dart';
import 'package:jewellery_store/pages/order_confirm_page/order_confirm_page.dart';

class CheckOutPage extends StatelessWidget {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController cardNoController = TextEditingController();
  TextEditingController expDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController cardHolderNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            cardImage(),
            paymentMethod(),
            SizedBox(height: 20),
            paymentDetail(),
            SizedBox(height: 20),
            proceedButton(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget cardImage() {
    return Container(
      height: Get.height * 0.30,
      child: Image.asset(ImageUrl.card),
    );
  }

  Widget paymentMethod() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Payment Method'),
          SizedBox(height: 5),
          Container(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: Image.asset(ImageUrl.visa),
                ),
                Expanded(
                  child: Image.asset(ImageUrl.mastercard),
                ),
                Expanded(
                  child: Image.asset(ImageUrl.paypal),
                ),
                Expanded(
                  child: Image.asset(ImageUrl.money),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentDetail() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payment Detail',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Form(
            key: formkey,
            child: Column(
              children: [
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Card No.'),
                      Container(
                        child: TextFormField(
                          cursorColor: CustomColor.kTealColor,
                          keyboardType: TextInputType.number,
                          maxLength: 12,
                          minLines: 1,
                          decoration: InputDecoration(
                            hintText: "        /        /        /",
                            counterText: '',
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: CustomColor.kTealColor,
                            )),
                          ),
                          controller: cardNoController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Card No Field Should be not Empty';
                            }
                            if (value.length != 12) {
                              return 'Enter Valid Card Number';
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Exp. Date'),
                            Container(
                              child: TextFormField(
                                cursorColor: CustomColor.kTealColor,
                                keyboardType: TextInputType.datetime,
                                maxLength: 5,
                                minLines: 1,
                                controller: expDateController,
                                decoration: InputDecoration(
                                  hintText: "MM/YY",
                                  counterText: '',
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: CustomColor.kTealColor,
                                  )),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Field should Not be Empty';
                                  }
                                  if (!value.contains('/')) {
                                    return 'Enter Valid Date';
                                  }
                                  if (value.length != 5) {
                                    return 'Enter Valid Date';
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('CVV'),
                            Container(
                              child: TextFormField(
                                cursorColor: CustomColor.kTealColor,
                                keyboardType: TextInputType.number,
                                maxLength: 3,
                                minLines: 1,
                                obscureText: true,
                                controller: cvvController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Field should Not be Empty';
                                  }
                                  if (value.length != 3) {
                                    return 'Enter Valid CVV';
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "000",
                                  counterText: '',
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                    color: CustomColor.kTealColor,
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Card Holder Name'),
                      Container(
                        child: TextFormField(
                          cursorColor: CustomColor.kTealColor,
                          // maxLength: 12,
                          minLines: 1,
                          obscureText: true,
                          controller: cardHolderNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Field should Not be Empty';
                            }
                          },
                          decoration: InputDecoration(
                            hintText: "Name",
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: CustomColor.kTealColor,
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget proceedButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      child: GestureDetector(
        onTap: () {
          print('Proceed Button Clicked');
          if (formkey.currentState!.validate()) {
            print('Inside formkey');
          }
          Get.to(OrderConfirmPage());
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
              'Proceed To Payment',
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
}
