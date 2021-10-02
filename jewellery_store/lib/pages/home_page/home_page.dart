import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/common/custom_drawer.dart';
import 'package:jewellery_store/common/image_url.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jewellery_store/pages/category_page/category_page.dart';
import 'package:jewellery_store/pages/product_detail_page/product_detail_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'homelist_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  final imgList = [
    ImageUrl.banner1,
    ImageUrl.banner2,
    ImageUrl.banner3,
  ];
  final mainCategoryImg = [
    ImageUrl.mainlist1,
    ImageUrl.mainlist2,
    ImageUrl.mainlist3,
    ImageUrl.mainlist4,
    ImageUrl.mainlist5,
    ImageUrl.mainlist1,
    ImageUrl.mainlist2,
    ImageUrl.mainlist3,
    ImageUrl.mainlist4,
    ImageUrl.mainlist5,
  ];

  List<HomeListItem> homeProductItems = [
    HomeListItem(
      imgUrl: ImageUrl.cart3,
      title: 'Donec eu nulla rutrum, various lorem quis lorem quis',
      rating: '3',
      activePrice: '2000',
      inActivePrice: '2500',
    ),
    HomeListItem(
      imgUrl: ImageUrl.cart2,
      title: 'Donec eu nulla rutrum, various lorem quis lorem quis',
      rating: '4',
      activePrice: '2100',
      inActivePrice: '2400',
    ),
    HomeListItem(
      imgUrl: ImageUrl.cart5,
      title: 'Donec eu nulla rutrum, various lorem quis lorem quis',
      rating: '3',
      activePrice: '1900',
      inActivePrice: '2500',
    ),
    HomeListItem(
      imgUrl: ImageUrl.cart1,
      title: 'Donec eu nulla rutrum, various lorem quis lorem quis',
      rating: '3',
      activePrice: '2000',
      inActivePrice: '2500',
    ),
    HomeListItem(
      imgUrl: ImageUrl.cart6,
      title: 'Donec eu nulla rutrum, various lorem quis lorem quis',
      rating: '3',
      activePrice: '2000',
      inActivePrice: '2500',
    ),
    HomeListItem(
      imgUrl: ImageUrl.cart4,
      title: 'Donec eu nulla rutrum, various lorem quis lorem quis',
      rating: '3',
      activePrice: '2000',
      inActivePrice: '2500',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(
          image: AssetImage(ImageUrl.logo2),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              print('Clicked On Search');
            },
            icon: Icon(Icons.search_rounded, size: 20),
            color: Colors.white,
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.centerRight,
                children: [
                  carouselSlider(),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 12, top: 5, bottom: 5),
                    child: carouselIndicator(),
                  ),
                ],
              ),
              SizedBox(height: 10),
              mainList(),
              SizedBox(height: 10),
              homeList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget carouselSlider() {
    return CarouselSlider.builder(
      itemCount: imgList.length,
      itemBuilder: (context, index, realIndex) {
        final imgUrl = imgList[index];
        return buildImage(imgUrl, index);
      },
      options: CarouselOptions(
          height: 160,
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

  //Carousel Slider Image
  Widget buildImage(String urlImage, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
        image: DecorationImage(
          image: AssetImage(urlImage),
          fit: BoxFit.cover,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
    );
  }

  Widget carouselIndicator() {
    return AnimatedSmoothIndicator(
      activeIndex: activeIndex,
      count: imgList.length,
      axisDirection: Axis.vertical,
      effect: WormEffect(
        dotHeight: 11,
        dotWidth: 11,
        activeDotColor: CustomColor.kTealColor,
        dotColor: Colors.white,
      ),
    );
  }

  Widget mainList() {
    return Container(
      height: 90,
      child: ListView.builder(
        itemCount: mainCategoryImg.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(5),
            child: GestureDetector(
              onTap: () {
                Get.to(CategoryPage());
              },
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Center(
                  child: Image(
                    image: AssetImage(mainCategoryImg[index]),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget homeList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemCount: homeProductItems.length,
      itemBuilder: (context, index) => index % 2 == 0
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Get.to(ProductDetailPage());
                  print('Clicked    1');
                },
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage(homeProductItems[index].imgUrl),
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
                              homeProductItems[index].title,
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
                                  '\$${homeProductItems[index].activePrice}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '\$${homeProductItems[index].activePrice}',
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
              ),
            )
          : Padding(
              padding: EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Get.to(ProductDetailPage());
                  print('Clicked    2');
                },
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              homeProductItems[index].title,
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
                                  '\$${homeProductItems[index].activePrice}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '\$${homeProductItems[index].activePrice}',
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
                            image: AssetImage(homeProductItems[index].imgUrl),
                            fit: BoxFit.cover,
                          )),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
