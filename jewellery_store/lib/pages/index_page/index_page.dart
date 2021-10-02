import 'package:flutter/material.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/pages/cart_page/cart_page.dart';
import 'package:jewellery_store/pages/favourite_page/favourite_page.dart';
import 'package:jewellery_store/pages/home_page/home_page.dart';
import 'package:jewellery_store/pages/profile_page/profile_page.dart';
import 'package:jewellery_store/pages/search_page/search_page.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

  int _currentIndex = 2;

  final tabs = [
    FavouritePage(),
    CartPage(),
    HomePage(),
    SearchPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: tabs[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        currentIndex: _currentIndex,
        iconSize: 20,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },

        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined),
              label: '',
              tooltip: 'Favourite',
              backgroundColor: CustomColor.kTealColor),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: '',
            tooltip: 'Cart',
            backgroundColor: CustomColor.kTealColor,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded),
              label: '',
              tooltip: 'Home',
              backgroundColor: CustomColor.kTealColor),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded),
              label: '',
              tooltip: 'Search',
              backgroundColor: CustomColor.kTealColor),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded),
            label: '',
            tooltip: 'Profile',
            backgroundColor: CustomColor.kTealColor,
          ),

        ],
      ),
      
    );
  }
}
