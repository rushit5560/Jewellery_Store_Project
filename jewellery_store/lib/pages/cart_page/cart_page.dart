import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/image_url.dart';
import 'package:jewellery_store/pages/checkout_page/checkout_page.dart';
import 'cart_model.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  List<SingleCartItem> cartItems = [
    SingleCartItem(
      productImgUrl: ImageUrl.cart1,
      productname: 'Product Name',
      activeAmount: '200',
      inactiveAmount: '250',
    ),
    SingleCartItem(
      productImgUrl: ImageUrl.cart2,
      productname: 'Product Name',
      activeAmount: '200',
      inactiveAmount: '250',
    ),
    SingleCartItem(
      productImgUrl: ImageUrl.cart3,
      productname: 'Product Name',
      activeAmount: '200',
      inactiveAmount: '250',
    ),
    SingleCartItem(
      productImgUrl: ImageUrl.cart4,
      productname: 'Product Name',
      activeAmount: '200',
      inactiveAmount: '250',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(height: 10),
            cartItemsList(),
            SizedBox(height: 20),
            couponCodeField(),
            SizedBox(height: 20),
            subTotal(),
            shipping(),
            discount(),
            total(),
            SizedBox(height: 20),
            checkoutButton(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget cartItemsList() {
    return Container(
      child: ListView.builder(
        itemCount: cartItems.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 10,
              child: Container(
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(6),
                                child: Container(
                                  height: 65,
                                  width: 65,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            cartItems[index].productImgUrl),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                              ),
                              SizedBox(width: 15),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      cartItems[index].productname,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 18),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        Text(
                                          '\$${cartItems[index].activeAmount}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: CustomColor.kTealColor,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '\$${cartItems[index].inactiveAmount}',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              decoration: TextDecoration.lineThrough
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Container(
                                      width: 50,
                                      height: 22,
                                      child: TextFormField(
                                        textAlign: TextAlign.center,
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(1)
                                        ],
                                        style: TextStyle(
                                          fontSize: 12,
                                        ),
                                        cursorColor: CustomColor.kTealColor,
                                        initialValue: '1',
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(horizontal: 10,
                                              vertical: 5),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.grey),
                                            borderRadius: BorderRadius.circular(6),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.delete_rounded),
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget couponCodeField() {
    return Container(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: Get.width * 0.45,
            child: TextFormField(
              cursorColor: CustomColor.kTealColor,
              style: TextStyle(
                color: Colors.black
              ),
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Promo Code",
                hintStyle: TextStyle(color: Colors.grey),
                isDense: true,
                contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 10),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          Container(
            width: Get.width * 0.25,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: CustomColor.kTealColor,
            ),
            child: Center(
              child: Text('Apply',
              style: TextStyle(
                // color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ),
        ],
      ),
    );
  }

  Widget subTotal() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Sub Total',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Text(
                '\$400.00',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(thickness: 2, color: Colors.white),
        ],
      ),
    );
  }

  Widget shipping() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shipping',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Text(
                '\$50.00',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(thickness: 2, color: Colors.white),
        ],
      ),
    );
  }

  Widget discount() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Discount',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
              Text(
                '\$00.00',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(thickness: 2, color: Colors.white),
        ],
      ),
    );
  }

  Widget total() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '\$450.00',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Divider(thickness: 2, color: Colors.white),
        ],
      ),
    );
  }

  Widget checkoutButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          print('Checkout Button');
          Get.to(CheckOutPage());
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: CustomColor.kTealColor,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 11),
            child: Text(
              'Checkout',
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
