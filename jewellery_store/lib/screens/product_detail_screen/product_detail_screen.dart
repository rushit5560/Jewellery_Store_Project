import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jewellery_store/common/api_url.dart';
import 'package:jewellery_store/common/common_widgets.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/common/image_url.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/read_more_text.dart';
import 'package:jewellery_store/controller/product_detail_screen_controller/product_detail_screen_controller.dart';
import '../../models/product_detail_screen_model/review_model.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  ProductDetailScreenController productDetailScreenController =
      Get.put(ProductDetailScreenController());

  bool viewMoreValue = false;
  int? activeColor;
  TextEditingController commentFieldController = TextEditingController();

  List<ReviewInfo> reviewList = [
    ReviewInfo(
      imgUrl: ImageUrl.profile,
      userName: 'Tokyo',
      stars: '4',
      description:
          'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: ImageUrl.profile,
      userName: 'Arturito',
      stars: '4.5',
      description:
          'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: ImageUrl.profile,
      userName: 'Berline',
      stars: '4.5',
      description:
          'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: ImageUrl.profile,
      userName: 'Neirobi',
      stars: '4.5',
      description:
          'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: ImageUrl.profile,
      userName: 'Tokyo',
      stars: '4',
      description:
          'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: ImageUrl.profile,
      userName: 'Tokyo',
      stars: '4',
      description:
          'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
  ];

  List<Color> colorList = [
    Colors.blue,
    Colors.red,
    Colors.lightGreenAccent,
    Colors.orangeAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Obx(
        () => productDetailScreenController.isLoading.value
            ? customCircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        // alignment: Alignment.bottomRight,

                        clipBehavior: Clip.none,
                        children: [
                          carouselSlider(),
                          Positioned(
                            right: 15,
                            bottom: -15,
                            child: cartButton(),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      productDetail(),
                      SizedBox(height: 20),
                      review(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget carouselSlider() {
    return CarouselSlider.builder(
      itemCount: productDetailScreenController.productDetailLists.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
              image: DecorationImage(
                image: NetworkImage(ApiUrl.ApiMainPath +
                    "${productDetailScreenController.productDetailLists[0].images[index]}"),
                fit: BoxFit.cover,
              )),
        );
      },
      options: CarouselOptions(
          height: Get.height * 0.25,
          autoPlay: true,
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            productDetailScreenController.activeIndex.value = index;
          }),
    );
  }

  Widget cartButton() {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: CustomColor.kTealColor,
          ),
          child: Center(
            child: IconButton(
              onPressed: () {
                if (productDetailScreenController.userId == null) {
                  Get.snackbar('Title', 'Login Required');
                } else {
                  productDetailScreenController.productAddToCart();
                }
              },
              icon: Icon(
                Icons.shopping_cart_rounded,
                size: 20,
              ),
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget productDetail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${productDetailScreenController.productDetailLists[0].productname}',
          textScaleFactor: 1.1,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        RatingBar.builder(
          itemCount: 5,
          ignoreGestures: true,
          unratedColor: CustomColor.kLightOrangeColor,
          allowHalfRating: true,
          itemSize: 20,
          minRating: 1,
          glow: false,
          initialRating: 3,
          itemBuilder: (context, _) {
            return Icon(
              Icons.star_rounded,
              color: CustomColor.kOrangeColor,
            );
          },
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        SizedBox(height: 5),
        Row(
          children: [
            Text(
              '\$${productDetailScreenController.productDetailLists[0].productcost}',
              textScaleFactor: 1.1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomColor.kTealColor,
              ),
            ),
            SizedBox(width: 10),
            Text(
              '\$${productDetailScreenController.productDetailLists[0].productcost}',
              textScaleFactor: 1.1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Container(
          child: ReadMoreText(
            productDetailScreenController.productDetailLists[0].fullText,
            trimLines: 4,
            colorClickableText: CustomColor.kTealColor,
            trimMode: TrimMode.Line,
            trimCollapsedText: '...More',
            trimExpandedText: ' Less',
            textAlign: TextAlign.justify,
          ),
        ),
        SizedBox(height: 10),
        colors(),
        productWidth(),
        productWeight(),
        productMaterial(),
        SizedBox(height: 10),
      ],
    );
  }

  Widget colors() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Color',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Container(
                height: 20,
                width: Get.width * 0.45,
                alignment: Alignment.centerRight,
                child: ListView.builder(
                  itemCount: colorList.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            activeColor = index;
                            print(activeColor);
                          });
                        },
                        child: Container(
                          padding: activeColor == index
                              ? EdgeInsets.all(2)
                              : EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            color: CustomColor.kTealColor,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                color: colorList[index],
                                shape: BoxShape.circle),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget productWidth() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Width',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                '${productDetailScreenController.productDetailLists[0].width} cm',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget productWeight() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Weight',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Text(
                '${productDetailScreenController.productDetailLists[0].weight} Kg',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget productMaterial() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Material',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              Container(
                width: Get.width * 0.45,
                child: Text(
                  'Rose Gold, Titanium',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          thickness: 2,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget review() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: ListView.builder(
            itemCount: viewMoreValue ? reviewList.length : 3,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: CircleAvatar(
                          radius: 25,
                          child: Image(
                            image: AssetImage(reviewList[index].imgUrl),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(reviewList[index].userName),
                            SizedBox(height: 2),
                            Container(
                              child: RatingBar.builder(
                                itemCount: 5,
                                ignoreGestures: true,
                                unratedColor: CustomColor.kLightOrangeColor,
                                allowHalfRating: true,
                                itemSize: 15,
                                minRating: 1,
                                glow: false,
                                // initialRating: 3,
                                itemBuilder: (context, _) {
                                  return Icon(
                                    Icons.star_rounded,
                                    color: CustomColor.kOrangeColor,
                                  );
                                },
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              reviewList[index].description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ]),
              );
            },
          ),
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  viewMoreValue = !viewMoreValue;
                });
                print(viewMoreValue);
              },
              child: Text(
                viewMoreValue ? 'View Less' : 'View More',
                textScaleFactor: 1.1,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                print('Clicked On Add Comment');
                productDetailScreenController.addReview.value = !productDetailScreenController.addReview.value;
              },
              child: Text(
                'Add Comment',
                textScaleFactor: 1.1,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline),
              ),
            ),


          ],
        ),
        SizedBox(height: 10),
        Visibility(
          visible: productDetailScreenController.addReview.value,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RatingBar.builder(
                itemCount: 5,
                // ignoreGestures: true,
                unratedColor: CustomColor.kLightOrangeColor,
                allowHalfRating: true,
                itemSize: 20,
                // minRating: 1,
                glow: false,
                initialRating: 0,
                itemBuilder: (context, _) {
                  return Icon(
                    Icons.star_rounded,
                    color: CustomColor.kOrangeColor,
                  );
                },
                onRatingUpdate: (rating) {
                  productDetailScreenController.reviewRating = rating;
                },
              ),
              const SizedBox(height: 5),
              TextFormField(
                controller: commentFieldController,
                maxLines: 2,
                decoration: inputDecoration(),
                validator: (value){
                  if(value!.isEmpty){
                    return "Comment Field not Empty";
                  }
                },
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: GestureDetector(
                  onTap: () {
                    productDetailScreenController.addProductReview(
                        "${productDetailScreenController.reviewRating}",
                    "${commentFieldController.text.trim()}");
                    commentFieldController.clear();
                    productDetailScreenController.addReview.value = !productDetailScreenController.addReview.value;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35),
                      color: CustomColor.kTealColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                      child: Text(
                        'Submit',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      hintText: 'Comment',
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }
}
