import 'package:flutter/material.dart';
import 'package:jewellery_store/common/api_url.dart';
import 'package:jewellery_store/common/common_widgets.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/controller/cart_screen_controller/cart_screen_controller.dart';
import 'package:jewellery_store/screens/checkout_screen/checkout_screen.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {
  CartScreenController cartScreenController = Get.put(CartScreenController());

  @override
  Widget build(BuildContext context) {
    cartScreenController.getUserDetailsFromPrefs();
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Obx(
        () => cartScreenController.isLoading.value
            ? customCircularProgressIndicator()
            : SingleChildScrollView(
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
      ),
    );
  }

  Widget cartItemsList() {
    return Container(
      child: ListView.builder(
        itemCount: cartScreenController.userCartProductLists.length,
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
                  clipBehavior: Clip.none,
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
                                        image: NetworkImage(
                                            ApiUrl.ApiMainPath + "asset/uploads/product/" + "${cartScreenController.userCartProductLists[index].showimg}"
                                        ),
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
                                      cartScreenController.userCartProductLists[index].productname,
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
                                          '\$${cartScreenController.userCartProductLists[index].productcost}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: CustomColor.kTealColor,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          '\$${cartScreenController.userCartProductLists[index].productcost}',
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
                                      child: Row(
                                        children: [

                                          GestureDetector(
                                            onTap: () {
                                              if(cartScreenController.userCartProductLists[index].cquantity > 1) {
                                                int cartQty = cartScreenController.userCartProductLists[index].cquantity;
                                                int cartQtyDec = cartQty - 1;
                                                print('cquantity -- : $cartQtyDec');
                                                cartScreenController.getAddProductCartQty(cartQtyDec, cartScreenController.userCartProductLists[index].cartDetailId);
                                                cartScreenController.getUserDetailsFromPrefs();
                                              }
                                            },
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                            ),
                                          ),
                                          const SizedBox(width: 3),

                                          Text(
                                            '${cartScreenController.userCartProductLists[index].cquantity}',
                                            textScaleFactor: 1.1,
                                          ),

                                          const SizedBox(width: 3),
                                          GestureDetector(
                                            onTap: () {
                                              int cartQty = cartScreenController.userCartProductLists[index].cquantity;
                                              int cartQtyInc = cartQty + 1;
                                              print('cquantity ++ : $cartQtyInc');
                                              cartScreenController.getAddProductCartQty(cartQtyInc, cartScreenController.userCartProductLists[index].cartDetailId);
                                              cartScreenController.getUserDetailsFromPrefs();
                                              },
                                            child: Icon(
                                              Icons.add_rounded,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    /*Container(
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
                                    ),*/
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            var cartDetailId = cartScreenController.userCartProductLists[index].cartDetailId;
                            cartScreenController.getDeleteProductCart(cartDetailId);
                            cartScreenController.getUserDetailsFromPrefs();
                          },
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
                '\$${cartScreenController.userCartTotalAmount}',
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
                '\$${cartScreenController.userCartTotalAmount}',
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
          Get.to(()=> CheckOutScreen());
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
