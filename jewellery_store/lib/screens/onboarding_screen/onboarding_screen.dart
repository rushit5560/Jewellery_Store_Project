import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/onboarding_screen_controller/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  final onBoardingController = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView.builder(
              controller: onBoardingController.pageController,
              onPageChanged: onBoardingController.selectedPageIndex,
              itemCount: onBoardingController.onBoardingPages.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        onBoardingController.onBoardingPages[index].imageAsset,
                        height: Get.height * 0.6,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          onBoardingController.onBoardingPages[index].title,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          onBoardingController
                              .onBoardingPages[index].description,
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            Positioned(
              bottom: 25,
              left: 20,
              child: Row(
                children: List.generate(
                  onBoardingController.onBoardingPages.length,
                  (index) => Obx(
                    () => Container(
                      margin: EdgeInsets.all(4),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                          color: onBoardingController.selectedPageIndex.value ==
                                  index
                              ? Colors.teal
                              : Colors.grey,
                          shape: BoxShape.circle),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 20,
              bottom: 25,
              child: FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.teal,
                onPressed: onBoardingController.forwardAction,
                child: Obx(
                  () => Text(
                    onBoardingController.isLastPage ? 'Start' : 'Next',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
