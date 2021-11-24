import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/api_url.dart';
import 'package:jewellery_store/common/common_widgets.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/controller/collection_screen_controller/collection_screen_controller.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jewellery_store/screens/product_detail_screen/product_detail_screen.dart';

class CollectionScreen extends StatelessWidget {
  CollectionScreenController collectionScreenController = Get.put(CollectionScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Collection'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: Obx(
        ()=> collectionScreenController.isLoading.value
        ? customCircularProgressIndicator()
        : ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: collectionScreenController.collectionLists.length,
          itemBuilder: (context, index) =>
            GestureDetector(
              onTap: () {
                Get.to(
                      () => ProductDetailScreen(),
                      arguments:
                          collectionScreenController.collectionLists[index].id,
                    );
                  },
              child: Container(
                child: index % 2 == 0
                    ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                  ApiUrl.ApiMainPath + "${collectionScreenController.collectionLists[index].showimg}"
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                collectionScreenController.collectionLists[index].productname,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Container(
                                child: RatingBar.builder(
                                  itemCount: 5,
                                  ignoreGestures: true,
                                  unratedColor: CustomColor.kLightYellowColor,
                                  allowHalfRating: true,
                                  itemSize: 15,
                                  minRating: 1,
                                  glow: false,
                                  initialRating: 4,
                                  itemBuilder: (context, _) {
                                    return Icon(
                                      Icons.star_rounded,
                                      color: CustomColor.kYellowColor,
                                    );
                                  },
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  Text(
                                    '\$${collectionScreenController.collectionLists[index].productcost}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '\$${collectionScreenController.collectionLists[index].productcost}',
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                    : Padding(
                  padding: EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                collectionScreenController.collectionLists[index].productname,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Container(
                                child: RatingBar.builder(
                                  itemCount: 5,
                                  ignoreGestures: true,
                                  unratedColor: CustomColor.kLightYellowColor,
                                  allowHalfRating: true,
                                  itemSize: 15,
                                  minRating: 1,
                                  glow: false,
                                  initialRating: 4,
                                  itemBuilder: (context, _) {
                                    return Icon(
                                      Icons.star_rounded,
                                      color: CustomColor.kYellowColor,
                                    );
                                  },
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                ),
                              ),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    '\$${collectionScreenController.collectionLists[index].productcost}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    '\$${collectionScreenController.collectionLists[index].productcost}',
                                    style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Container(
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(
                                  ApiUrl.ApiMainPath + "${collectionScreenController.collectionLists[index].showimg}"
                              ),
                              fit: BoxFit.cover,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ),

        ),
      ),
    );
  }
}
