import 'package:flutter/material.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/common/image_url.dart';
import 'collection_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CollectionPage extends StatelessWidget {
  List<CollectionItem> collectionItems = [
    CollectionItem(
      imgUrl: ImageUrl.cart3,
      title: 'Donec eu nulla rutrum, various lorem quis lorem quis',
      rating: '3',
      activePrice: '2000',
      inActivePrice: '2500',
    ),
    CollectionItem(
      imgUrl: ImageUrl.cart2,
      title: 'Donec eu nulla rutrum, various lorem quis lorem quis',
      rating: '4',
      activePrice: '2100',
      inActivePrice: '2400',
    ),
    CollectionItem(
      imgUrl: ImageUrl.cart5,
      title: 'Donec eu nulla rutrum, various lorem quis lorem quis',
      rating: '3',
      activePrice: '1900',
      inActivePrice: '2500',
    ),
    CollectionItem(
      imgUrl: ImageUrl.cart1,
      title: 'Donec eu nulla rutrum, various lorem quis lorem quis',
      rating: '3',
      activePrice: '2000',
      inActivePrice: '2500',
    ),
    CollectionItem(
      imgUrl: ImageUrl.cart6,
      title: 'Donec eu nulla rutrum, various lorem quis lorem quis',
      rating: '3',
      activePrice: '2000',
      inActivePrice: '2500',
    ),
    CollectionItem(
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
        title: Text('Collection'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: ListView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: collectionItems.length,
        itemBuilder: (context, index) =>
          index % 2 == 0
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
                        image: AssetImage(collectionItems[index].imgUrl),
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
                          collectionItems[index].title,
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
                                '\$${collectionItems[index].activePrice}',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '\$${collectionItems[index].activePrice}',
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
                              collectionItems[index].title,
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
                                  '\$${collectionItems[index].activePrice}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '\$${collectionItems[index].activePrice}',
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
                            image: AssetImage(collectionItems[index].imgUrl),
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
