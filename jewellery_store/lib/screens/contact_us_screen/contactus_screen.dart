import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ContactUsScreen extends StatelessWidget {

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailIdController = TextEditingController();
  TextEditingController subjectController = TextEditingController();
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              map(),
              SizedBox(height: 20),
              Container(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      fullNameField(),
                      SizedBox(height: 25),
                      emailIdField(),
                      SizedBox(height: 25),
                      subjectField(),
                      SizedBox(height: 25),
                      commentField(),
                      SizedBox(height: 25),
                      submitButton(),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget map() {

    final CameraPosition _kGooglePlex = CameraPosition(
      target: LatLng(21.1860, 72.7944),
      zoom: 7,
    );
    Completer<GoogleMapController> _controller = Completer();

    return Container(
      height: Get.height * 0.25,
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationEnabled: true,
      ),
    );
  }

  Widget fullNameField() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Full Name',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
            cursorColor: CustomColor.kTealColor,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(25)),
            ),
            controller: nameController,
            validator: (value) {
              if (value!.isEmpty /* || value.length == null*/) {
                return "Name cannot be empty";
              }
            },
          )
        ],
      ),
    );
  }

  Widget emailIdField() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Email Id',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
            cursorColor: CustomColor.kTealColor,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(25)),
            ),
            controller: emailIdController,
            validator: (value) {
              if (value!.isEmpty /* || value.length == null*/) {
                return "Email cannot be empty";
              } else if(!value.contains('a')){
                return 'Email Should be valid';
              }
            },
          )
        ],
      ),
    );
  }

  Widget subjectField() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Subject',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
            cursorColor: CustomColor.kTealColor,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(25)),
            ),
            controller: subjectController,
            validator: (value) {
              if (value!.isEmpty /* || value.length == null*/) {
                return "Subject cannot be empty";
              }
            },
          )
        ],
      ),
    );
  }

  Widget commentField() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Comment',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
            cursorColor: CustomColor.kTealColor,
            maxLines: 4,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(15)),
            ),
            controller: commentController,
            validator: (value) {
              if (value!.isEmpty) {
                return "Comment cannot be empty";
              }
            },
          )
        ],
      ),
    );
  }

  Widget submitButton() {

    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          print('Clicked On Submit Button');
          if (formKey.currentState!.validate()) {
            print('Inside formkey');
          }
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: CustomColor.kTealColor,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  'Submit',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 15),
                ),
              )),
        ),
      ),
    );
  }
}
