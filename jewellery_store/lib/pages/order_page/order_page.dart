import 'package:flutter/material.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/common/image_url.dart';

import 'order_model.dart';

class OrderPage extends StatelessWidget {

  List<OrderInfo> orderLists = [
    OrderInfo(
      imgUrl: ImageUrl.cart1,
      title: 'Product Name Product Name Product Name Product Name',
      activePrice: '1200',
      inActivePrice: '1500',
      itemCount: '1',
    ),
    OrderInfo(
      imgUrl: ImageUrl.cart4,
      title: 'Product Name Product Name Product Name Product Name',
      activePrice: '1200',
      inActivePrice: '1500',
      itemCount: '1',
    ),
    OrderInfo(
      imgUrl: ImageUrl.cart3,
      title: 'Product Name Product Name',
      activePrice: '1200',
      inActivePrice: '1500',
      itemCount: '1',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              dateShow(),
              SizedBox(height: 10),
              orderList(),
              SizedBox(height: 20),
              dateShow(),
              SizedBox(height: 10),
              orderList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget dateShow() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            '24 Dec 2020',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 3),
        Divider(color: Colors.white),
      ],
    );
  }

  Widget orderList() {
    return ListView.builder(
      itemCount: orderLists.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Container(
                height: 85, width: 85,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage(orderLists[index].imgUrl),
                    fit: BoxFit.cover,
                  )
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        orderLists[index].title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        Text(
                          '\$${orderLists[index].activePrice}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: CustomColor.kTealColor,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          '\$${orderLists[index].activePrice}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Items: ${orderLists[index].itemCount}',
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
