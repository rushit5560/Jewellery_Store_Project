import 'package:flutter/material.dart';
import 'package:jewellery_store/common/image_url.dart';

import '../../models/notification_screen_model/notification_model.dart';

class NotificationScreen extends StatelessWidget {


  List<NotificationInfo> notificationItems = [
    NotificationInfo(
      imgUrl: ImageUrl.noti1,
      title: 'Black Friday',
      description: 'Donec eu nulla rutrum, various lorem quis lorem quis',
    ),
    NotificationInfo(
      imgUrl: ImageUrl.noti3,
      title: '30% Off On Your First Order',
      description: 'Donec eu nulla rutrum, various lorem quis lorem quis',
    ),
    NotificationInfo(
      imgUrl: ImageUrl.noti2,
      title: 'Your Order Has Confirmed',
      description: 'Donec eu nulla rutrum, various lorem quis lorem quis',
    ),
    NotificationInfo(
      imgUrl: ImageUrl.noti1,
      title: 'Black Friday',
      description: 'Donec eu nulla rutrum, various lorem quis lorem quis',
    ),
    NotificationInfo(
      imgUrl: ImageUrl.noti3,
      title: '30% Off On Your First Order',
      description: 'Donec eu nulla rutrum, various lorem quis lorem quis',
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

      body: ListView.separated(
        itemCount: notificationItems.length,
        separatorBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Divider(
              color: Colors.grey,
            ),
          );
        },
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 75, width: 75,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(notificationItems[index].imgUrl),
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
                          notificationItems[index].title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        notificationItems[index].description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
