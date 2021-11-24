import 'package:flutter/material.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: Center(
        child: Text('Favourite Page'),
      ),
    );
  }
}
