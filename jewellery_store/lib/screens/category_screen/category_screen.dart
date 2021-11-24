import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/api_url.dart';
import 'package:jewellery_store/common/common_widgets.dart';
import 'package:jewellery_store/controller/category_screen_controller/category_screen_controller.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreenController categoryScreenController = Get.put(CategoryScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Obx(
        ()=> categoryScreenController.isLoading.value
        ? customCircularProgressIndicator()
        : Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: categoryScreenController.categoryLists.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      alignment: index % 2 == 0
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      children: [
                        Container(
                          height: 120,
                          width: Get.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image:
                                  NetworkImage(
                                    ApiUrl.ApiMainPath + "${categoryScreenController.categoryLists[index].showimg}",
                                  ),
                              fit: BoxFit.cover
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            categoryScreenController.categoryLists[index].categoryName,
                            textAlign: index % 2 == 0
                                ? TextAlign.left
                                : TextAlign.start,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

}
