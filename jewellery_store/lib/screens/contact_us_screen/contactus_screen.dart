import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/common_widgets.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jewellery_store/controller/contact_us_screen__controller/contact_us_screen__controller.dart';

class ContactUsScreen extends StatelessWidget {

  ContactUsScreenController contactUsScreenController = Get.put(ContactUsScreenController());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNoController = TextEditingController();
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

      body: Obx(
        () => contactUsScreenController.isLoading.value
            ? customCircularProgressIndicator()
            : SingleChildScrollView(
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
                              phoneNoField(),
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
            controller: nameController,
            cursorColor: CustomColor.kTealColor,
            validator: (value) {
              if (value!.isEmpty) {
                return "Name cannot be empty";
              }
            },
            decoration: inputDecoration(0),
          )
        ],
      ),
    );
  }

  Widget phoneNoField() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Phone No',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
            controller: phoneNoController,
            cursorColor: CustomColor.kTealColor,
            keyboardType: TextInputType.number,
            maxLength: 10,
            validator: (value) {
              if (value!.isEmpty) {
                return "Phone Number cannot be empty";
              } else if(value.length != 10){
                return "Phone Number must be 10 Digit";
              }
            },
            decoration: inputDecoration(0),
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
            decoration: inputDecoration(0),
            controller: emailIdController,
            validator: (value) {
              if (value!.isEmpty /* || value.length == null*/) {
                return "Email cannot be empty";
              } else if(!value.contains('@')){
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
            decoration: inputDecoration(0),
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
            decoration: inputDecoration(1),
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
      child: GestureDetector(
        onTap: () {
          if (formKey.currentState!.validate()) {
            contactUsScreenController.getContactUsData(
                '${nameController.text.trim()}',
                '${emailIdController.text.trim().toLowerCase()}',
                '${phoneNoController.text.trim()}',
                '${subjectController.text.trim()}',
                '${commentController.text.trim()}');
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


  InputDecoration inputDecoration(index) {
    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      counterText: '',
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(index == 0 ? 25 : 10),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(index == 0 ? 25 : 10),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(index == 0 ? 25 : 10),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(index == 0 ? 25 : 10),
      ),
    );
  }
}
