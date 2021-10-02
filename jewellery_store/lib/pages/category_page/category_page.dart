import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewellery_store/common/image_url.dart';
import 'package:get/get.dart';
import 'category_model.dart';

class CategoryPage extends StatelessWidget {
  List<CategoryModel> categoryItems = [
    CategoryModel(categoryImage: ImageUrl.category1, categoryName: 'Rings'),
    CategoryModel(
        categoryImage: ImageUrl.category2, categoryName: 'Necklace'),
    CategoryModel(
        categoryImage: ImageUrl.category3, categoryName: 'Couple Rings'),
    CategoryModel(categoryImage: ImageUrl.category4, categoryName: 'Crown'),
    CategoryModel(
        categoryImage: ImageUrl.category5, categoryName: 'New Arrivals'),
    CategoryModel(
        categoryImage: ImageUrl.category6, categoryName: 'Bracelet'),
    CategoryModel(categoryImage: ImageUrl.category1, categoryName: 'Rings'),
    CategoryModel(
        categoryImage: ImageUrl.category2, categoryName: 'Necklace'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: categoryItems.length,
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
                                AssetImage(categoryItems[index].categoryImage),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          categoryItems[index].categoryName,
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
    );
  }

  Widget item() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 120,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                image: AssetImage('categoryItems.categoryImage'))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'categoryItems[index].categoryName',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
