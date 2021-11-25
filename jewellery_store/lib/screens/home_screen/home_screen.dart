import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/api_url.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/common/custom_drawer.dart';
import 'package:jewellery_store/common/image_url.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:jewellery_store/controller/home_screen_controller/home_screen_controller.dart';
import 'package:jewellery_store/screens/category_screen/category_screen.dart';
import 'package:jewellery_store/screens/product_detail_screen/product_detail_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../models/home_screen_model/homelist_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  // int activeIndex = 0;
  // final imgList = [
  //   ImageUrl.banner1,
  //   ImageUrl.banner2,
  //   ImageUrl.banner3,
  // ];
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
    return Obx(
      () => homeScreenController.isLoading.value
          ? Container(
              width: Get.width,
              height: Get.height,
              color: Colors.transparent,
              child: Center(
                child: CircularProgressIndicator(
                  color: CustomColor.kTealColor,
                  backgroundColor: Colors.white,
                ),
              ),
            )
          : Scaffold(
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
                            padding: const EdgeInsets.only(
                                right: 12, top: 5, bottom: 5),
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
            ),
    );
  }

  Widget carouselSlider() {
    return Obx(
      ()=> CarouselSlider.builder(
        itemCount: homeScreenController.bannerLists.length,
        itemBuilder: (context, index, realIndex) {
          final imgUrl = ApiUrl.ApiMainPath + '${homeScreenController.bannerLists[index].imagePath}';
          return buildImage(imgUrl, index);
        },
        options: CarouselOptions(
            height: 160,
            autoPlay: true,
            // scrollDirection: Axis.vertical,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                homeScreenController.activeIndex.value = index;
              });
            }),
      ),
    );
  }

  //Carousel Slider Image
  Widget buildImage(String urlImage, int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey,
        image: DecorationImage(
          image: NetworkImage(urlImage),
          fit: BoxFit.cover,
        ),
      ),
      margin: EdgeInsets.symmetric(horizontal: 5),
    );
  }

  Widget carouselIndicator() {
    return Obx(
          () => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          homeScreenController.bannerLists.length,
              (index) => Container(
            margin: EdgeInsets.all(4),
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              color: homeScreenController.activeIndex.value == index
                  ? CustomColor.kOrangeColor
                  : Colors.black,
              shape: BoxShape.circle,
            ),
          ),
        ),
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
                Get.to(() => CategoryScreen());
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
                  // Get.to(() => ProductDetailScreen());

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
                  Get.to(() => ProductDetailScreen());
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
