import 'package:flutter/material.dart';
import 'package:jewellery_store/common/custom_color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
        child: Column(
          children: [
            searchBar(),
          ],
        ),
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 40,
          child: Center(
            child: TextFormField(
              cursorColor: CustomColor.kTealColor,
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.search_rounded,
                    color: CustomColor.kTealColor,
                  ),
                  isDense: true,
                  contentPadding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    // borderSide: BorderSide(width: 5),
                    borderSide: BorderSide.none,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
