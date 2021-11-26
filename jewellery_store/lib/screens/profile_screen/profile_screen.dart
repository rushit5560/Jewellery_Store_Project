import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/common/image_url.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jewellery_store/screens/cart_screen/cart_screen.dart';
import 'package:jewellery_store/screens/order_screen/order_screen.dart';
import 'package:jewellery_store/screens/settings_screen/settings_screen.dart';

enum Gender {male, female}

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController alertUserNameController = TextEditingController();
  TextEditingController alertEmailIdController = TextEditingController();
  TextEditingController alertPhoneNoController = TextEditingController();
  TextEditingController alertAddressController = TextEditingController();
  TextEditingController alertPasswordController = TextEditingController();
  Gender? _gender = Gender.male;
  final picker = ImagePicker();
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                editProfileButton(context),
                SizedBox(height: 10),
                profileNameEmail(context),
                SizedBox(height: 30),
                userName(),
                SizedBox(height: 20),
                emailId(),
                SizedBox(height: 20),
                phoneNo(),
                SizedBox(height: 20),
                address(),
                SizedBox(height: 20),
                gender(),
                SizedBox(height: 10),
                myOrder(),
                SizedBox(height: 10),
                cart(),
                SizedBox(height: 10),
                settings(),
                SizedBox(height: 10),
                // alertRadioButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget editProfileButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {
            editAccountDetails(context);
          },
          icon: Icon(
            Icons.person_rounded,
            color: CustomColor.kTealColor,
            size: 23,
          ),
        ),
      ],
    );
  }

  Widget profileNameEmail(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            _image != null
                ? Container(
              width: Get.width * 0.40,
              height: Get.width * 0.40,
              decoration: BoxDecoration(
                // color: CustomColor().kLightYellowColor,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: FileImage(_image!),
                  fit: BoxFit.cover,
                ),
              ),
            )
            : Container(
              width: Get.width * 0.40,
              height: Get.width * 0.40,
              decoration: BoxDecoration(
                // color: CustomColor().kLightYellowColor,
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(ImageUrl.profile),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 20,
              child: GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Icon(
                        Icons.camera_alt_rounded,
                        color: CustomColor.kTealColor,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Text(
          'Jenny Doe',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'jenny123@demo.com',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget userName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'UserName',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Jenny Doe',
          // style: TextStyle(
          //   fontWeight: FontWeight.bold,
          // ),
        ),
        SizedBox(height: 10),
        Divider(
          color: Colors.grey,
          thickness: 2,
        ),
      ],
    );
  }

  Widget emailId() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'EmailId',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'jenny123@demo.com',
          // style: TextStyle(
          //   fontWeight: FontWeight.bold,
          // ),
        ),
        SizedBox(height: 10),
        Divider(
          color: Colors.grey,
          thickness: 2,
        ),
      ],
    );
  }

  Widget phoneNo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Phone No.',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          '+91 1234567890',
          // style: TextStyle(
          //   fontWeight: FontWeight.bold,
          // ),
        ),
        SizedBox(height: 10),
        Divider(
          color: Colors.grey,
          thickness: 2,
        ),
      ],
    );
  }

  Widget address() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          '7000, WhiteField, Manchester Highway, London, London, 401203',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          // style: TextStyle(
          //   fontWeight: FontWeight.bold,
          // ),
        ),
        SizedBox(height: 10),
        Divider(
          color: Colors.grey,
          thickness: 2,
        ),
      ],
    );
  }

  Widget gender() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Gender',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(
          'Female',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          // style: TextStyle(
          //   fontWeight: FontWeight.bold,
          // ),
        ),
        SizedBox(height: 10),
        Divider(
          color: Colors.grey,
          thickness: 2,
        ),
      ],
    );
  }

  Widget myOrder() {
    return GestureDetector(
      onTap: () {
        Get.to(()=> OrderScreen());
      },
      child: Container(
        width: Get.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('My Order'),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                )
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget cart() {
    return GestureDetector(
      onTap: () {
        Get.to(()=> CartScreen());
      },
      child: Container(
        width: Get.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Cart'),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                )
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }

  Widget settings() {
    return GestureDetector(
      onTap: () {
        Get.to(()=> SettingsScreen());
      },
      child: Container(
        width: Get.width,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Settings'),
                Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20,
                )
              ],
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.grey,
              thickness: 2,
            ),
          ],
        ),
      ),
    );
  }

  editAccountDetails(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (context, setState2){
                return AlertDialog(
                  content: Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Edit Profile',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Divider(
                            thickness: 2,
                            color: CustomColor.kTealColor,
                          ),
                          SizedBox(height: 5),
                          alertDialogUserNameField(),
                          SizedBox(height: 5),
                          alertDialogEmailIdField(),
                          SizedBox(height: 5),
                          alertDialogPhoneNoField(),
                          SizedBox(height: 5),
                          alertDialogAddressField(),
                          SizedBox(height: 5),
                          alertRadioButton(setState2),
                          SizedBox(height: 5),
                          alertDialogPasswordField(),
                          SizedBox(height: 15),
                          alertUpdateButton(),
                        ],
                      ),
                    ),
                  ),
                );
              }
          );
        });
  }

  Widget alertRadioButton(setState2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: Row(
            children: [
              Radio(
                  value: Gender.male,
                  groupValue: _gender,
                  onChanged: (Gender? val){
                    setState2(() {
                      print('--Male Clicked--');
                      _gender = val!;
                      print(_gender);
                    });
                  },
              ),
              SizedBox(width: 5),
              Text(
                  'Male',
                style: TextStyle(
                  color: Colors.black
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: 10),
        Container(
          child: Row(
            children: [
              Radio(
                value: Gender.female,
                groupValue: _gender,
                onChanged: (Gender? val){
                  setState2(() {
                    print('-----Female Clicked-----');
                    _gender = val!;
                    print(_gender);

                  });
                },
              ),
              SizedBox(width: 5),
              Text(
                'Female',
                style: TextStyle(
                    color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget alertDialogUserNameField() {
    return TextFormField(
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black),
      controller: alertUserNameController,
      validator: (value) {
        if(value!.isEmpty){
          return 'Username Should not be Empty';
        }
      },
      decoration: InputDecoration(
        hintText: 'UserName',
        hintStyle: TextStyle(color: Colors.grey),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide()),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide()),
      ),
    );
  }

  Widget alertDialogEmailIdField() {
    return TextFormField(
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black),
      controller: alertEmailIdController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if(value!.isEmpty){
          return 'Email Id Should not be Empty';
        } else if (!value.contains('@')){
          return 'Enter Valid Email Id';
        }
      },
      decoration: InputDecoration(
        hintText: 'Email Id',
        hintStyle: TextStyle(color: Colors.grey),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide()),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide()),
      ),
    );
  }

  Widget alertDialogPhoneNoField() {
    return TextFormField(
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black),
      maxLength: 10,
      keyboardType: TextInputType.number,
      controller: alertPhoneNoController,
      validator: (value) {
        if(value!.isEmpty){
          return 'Phone No. Should not be Empty';
        }
        else if (value.length != 10) {
          return 'Phone No. Must be 10 Digit';
        }
      },
      decoration: InputDecoration(
        hintText: 'Phone No.',
        counterText: '',
        hintStyle: TextStyle(color: Colors.grey),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide()),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide()),
      ),
    );
  }

  Widget alertDialogAddressField() {
    return TextFormField(
      cursorColor: Colors.black,
      style: TextStyle(color: Colors.black),
      controller: alertAddressController,
      validator: (value) {
        if(value!.isEmpty){
          return 'Address Should not be Empty';
        }
      },
      decoration: InputDecoration(
        hintText: 'Address',
        hintStyle: TextStyle(color: Colors.grey),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide()),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide()),
      ),
    );
  }

  Widget alertDialogPasswordField() {
    return TextFormField(
      cursorColor: Colors.black,
      // obscureText: true,
      style: TextStyle(color: Colors.black),
      controller: alertPasswordController,
      validator: (value) {
        if(value!.isEmpty){
          return 'Password Should not be Empty';
        }
      },
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: TextStyle(color: Colors.grey),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide()),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide()),
      ),
    );
  }

  String? username, emailid, phoneno, addres, password;
  Gender? jati;

  Widget alertUpdateButton() {
    username = alertUserNameController.text.trim();
    emailid = alertEmailIdController.text.trim();
    phoneno = alertPhoneNoController.text.trim();
    jati = _gender;
    addres = alertAddressController.text.trim();
    password = alertPasswordController.text.trim();

    return Container(
      child: GestureDetector(
        onTap: () {
          if (formKey.currentState!.validate()) {
            print('Inside formkey');
            print(
                '$username &&& $emailid &&& $phoneno &&& $jati &&& $addres &&& $password');
          }
        },
        child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              color: CustomColor.kTealColor,
              borderRadius: BorderRadius.circular(25)),
          child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Update',
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

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Gallery'),
                      onTap: () {
                        //_imgFromGallery();
                        gallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      camera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  Future camera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  Future gallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
