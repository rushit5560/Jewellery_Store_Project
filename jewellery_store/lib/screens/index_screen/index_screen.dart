import 'package:flutter/material.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/screens/cart_screen/cart_screen.dart';
import 'package:jewellery_store/screens/favourite_screen/favourite_screen.dart';
import 'package:jewellery_store/screens/home_screen/home_screen.dart';
import 'package:jewellery_store/screens/profile_screen/profile_screen.dart';
import 'package:jewellery_store/screens/search_screen/search_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {

  int _currentIndex = 2;

  final tabs = [
    FavouriteScreen(),
    CartScreen(),
    HomeScreen(),
    SearchScreen(),
    ProfileScreen(),
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
