import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/common/image_url.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/read_more_text.dart';
import 'package:jewellery_store/screens/cart_screen/cart_screen.dart';

import '../../models/product_detail_screen_model/review_model.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int activeIndex = 0;
  bool viewMoreValue = false;
  int? activeColor;

  final productImages = [
    ImageUrl.product1,
    ImageUrl.product2,
    ImageUrl.product3,
  ];
  String desText =
      'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD, 120Hz Refresh Rate, IPS-level Anti-Glare Panel, 100% DCI-P3, Pantone Validated Graphics: Dedicated NVIDIA GeForce RTX 3060 GDDR6 6GB VRAM, With ROG Boost up to 1382MHz at 60W TGP + 20W with Dynamic Boost';

  List<ReviewInfo> reviewList = [
    ReviewInfo(
      imgUrl: ImageUrl.profile,
      userName: 'Tokyo',
      stars: '4',
      description: 'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: ImageUrl.profile,
      userName: 'Arturito',
      stars: '4.5',
      description: 'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: ImageUrl.profile,
      userName: 'Berline',
      stars: '4.5',
      description: 'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: ImageUrl.profile,
      userName: 'Neirobi',
      stars: '4.5',
      description: 'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: ImageUrl.profile,
      userName: 'Tokyo',
      stars: '4',
      description: 'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
    ReviewInfo(
      imgUrl: ImageUrl.profile,
      userName: 'Tokyo',
      stars: '4',
      description: 'Processor: AMD Ryzen 9 5900HS, 2.8 GHz Base Speed, Up to 4.6 GHz TurboBoost Speed, 8 Cores, 16 Threads, 20M Cache Display: 35.56 cm (14-inch) WQHD (2560 x 1440) 16:9 LED-Backlit LCD',
    ),
  ];

  List<Color> colorList = [
    Colors.blue, Colors.red, Colors.lightGreenAccent, Colors.orangeAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Detail'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Stack(
                // alignment: Alignment.bottomRight,
                overflow: Overflow.visible,
                children: [
                  carouselSlider(),
                  Positioned(
                    right: 15, bottom: -15,
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
    );
  }

  Widget carouselSlider() {
    return CarouselSlider.builder(
      itemCount: productImages.length,
      itemBuilder: (context, index, realIndex) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            image: DecorationImage(
              image: AssetImage(productImages[index]),
              fit: BoxFit.cover,
            )
          ),
        );
      },
      options: CarouselOptions(
          height: Get.height * 0.25,
          autoPlay: true,
          // autoPlayInterval: Duration(seconds: 3),
          viewportFraction: 1,
          onPageChanged: (index, reason) {
            setState(() {
              activeIndex = index;
            });
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
                Get.to(()=> CartScreen());
                print('Cart Button Clicked');
              },
              icon: Icon(Icons.shopping_cart_rounded,size: 20,),
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
        Text('Lorem ipsum dolor sit amet, consectetur',
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
              '\$200',
              textScaleFactor: 1.1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomColor.kTealColor,
              ),
            ),
            SizedBox(width: 10),
            Text(
              '\$210',
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
            desText,
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
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
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
                          padding: activeColor == index ?  EdgeInsets.all(2) : EdgeInsets.all(0),
                          decoration: BoxDecoration(
                            color: CustomColor.kTealColor,
                            shape: BoxShape.circle,
                          ),
                          child: Container(
                            width: 20, height: 20,
                            decoration: BoxDecoration(
                              color: colorList[index],
                              shape: BoxShape.circle
                            ),
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
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              ),
              Text('1.0 cm',
              style: TextStyle(
                fontSize: 15
              ),),
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
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
              ),
              Text('18.0 Kg',
                style: TextStyle(
                    fontSize: 15
                ),),
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
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
              ),

              Container(
                width: Get.width * 0.45,
                child: Text('Rose Gold, Titanium',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 15,

                  ),),
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
                    ]
                ),
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
                    decoration: TextDecoration.underline
                ),
              ),
            ),
            SizedBox(width: 20),
            GestureDetector(
              onTap: () {
                print('Clicked On Add Comment');
              },
              child: Text('Add Comment',
                textScaleFactor: 1.1,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

}
