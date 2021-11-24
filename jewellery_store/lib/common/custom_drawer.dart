import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/screens/category_screen/category_screen.dart';
import 'package:jewellery_store/screens/collection_screen/collection_screen.dart';
import 'package:jewellery_store/screens/contact_us_screen/contactus_screen.dart';
import 'package:jewellery_store/screens/index_screen/index_screen.dart';
import 'package:jewellery_store/screens/notification_screen/notification_screen.dart';
import 'package:jewellery_store/screens/profile_screen/profile_screen.dart';
import 'package:jewellery_store/screens/settings_screen/settings_screen.dart';
import 'package:jewellery_store/screens/signin_screen/signin_screen.dart';
import 'image_url.dart';
import 'custom_color.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: CustomColor.kTealColor,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SingleChildScrollView(
                child: Container(
                  // color: CustomColor().kTealColor,
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      closeButton(),
                      SizedBox(height: 5),
                      profilePicAndName(),
                      SizedBox(height: 20),

                      Container(
                        child: Column(
                          children: [
                            homeButton(),
                            divider(),
                            category(),
                            divider(),
                            collectionButton(),
                            divider(),
                            settingsButton(),
                            divider(),
                            notificationButton(),
                            divider(),
                            profileButton(),
                            divider(),
                            contactUsButton(),
                            divider(),
                            logInButton(),
                            // contactUsButton(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // logoutButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget divider() {
    return Divider(color: Colors.white,
      indent: 15, endIndent: 15,height: 0,);
  }

  Widget closeButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(onTap: () {
            Get.back();
          },
              child: Icon(CupertinoIcons.clear,
              color: Colors.black,),
          ),
        ],
      ),
    );
  }

  Widget profilePicAndName() {
    return Container(
      child: Column(
        children: [
          Container(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: CustomColor.kTealColor,
              backgroundImage: AssetImage(ImageUrl.profile),
            ),
          ),
          Text(
            'Jenny Doe',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,
            color: Colors.black,),
          ),
          // Text(
          //   'jennydoe@gmail.com',
          //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),
          // ),
        ],
      ),
    );
  }

  Widget homeButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.off(()=> IndexScreen());
      },
      leading: Icon(Icons.home_outlined,color: Colors.black,),
      title: Text('Home',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget category() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(()=> CategoryScreen());
      },
      leading: Icon(Icons.category_outlined,color: Colors.black,),
      title: Text('Categories',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget collectionButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(()=> CollectionScreen());
      },
      leading: Icon(Icons.storefront_outlined,color: Colors.black,),
      title: Text('Collection',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget settingsButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(()=> SettingsScreen());
      },
      leading: Icon(Icons.settings_outlined,color: Colors.black,),
      title: Text('Settings',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget notificationButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(()=> NotificationScreen());
      },
      leading: Icon(Icons.notifications_on_outlined,color: Colors.black,),
      title: Text('Notification',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget profileButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(()=> ProfileScreen());
      },
      leading: Icon(Icons.person_outline_outlined,color: Colors.black,),
      title: Text('Profile',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget contactUsButton() {
    return ListTile(
      onTap: () {
        Get.back();
        Get.to(()=> ContactUsScreen());
      },
      leading: Icon(Icons.contact_phone_outlined,color: Colors.black,),
      title: Text('Contact Us',
        textScaleFactor: 1.2,
        style: TextStyle(color: Colors.black),
      ),
    );
  }

  Widget logInButton() {
    return Container(
      child: ListTile(
        onTap: () {
          Get.back();
          Get.to(()=> SignInScreen());
        },
        leading: Icon(Icons.login_outlined,color: Colors.black,),
        title: Text('LogIn',
          textScaleFactor: 1.2,
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }



}
