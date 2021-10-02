import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/pages/category_page/category_page.dart';
import 'package:jewellery_store/pages/collection_page/collection_page.dart';
import 'package:jewellery_store/pages/contact_us_page/contactus_page.dart';
import 'package:jewellery_store/pages/index_page/index_page.dart';
import 'package:jewellery_store/pages/notification_page/notification_page.dart';
import 'package:jewellery_store/pages/profile_page/profile_page.dart';
import 'package:jewellery_store/pages/settings/settings_page.dart';
import 'package:jewellery_store/pages/signin_page/signin_page.dart';
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
        Get.off(IndexPage());
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
        Get.to(CategoryPage());
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
        Get.to(CollectionPage());
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
        Get.to(SettingsPage());
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
        Get.to(NotificationPage());
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
        Get.to(ProfilePage());
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
        Get.to(ContactUsPage());
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
          Get.to(SignInPage());
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
