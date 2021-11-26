import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jewellery_store/common/common_widgets.dart';
import 'package:jewellery_store/common/custom_color.dart';
import 'package:jewellery_store/controller/change_password_screen_controller/change_password_screen_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  // const ForgotPasswordScreen({Key? key}) : super(key: key);
  ChangePasswordScreenController changePasswordScreenController =
      Get.put(ChangePasswordScreenController());

  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController oldPasswordFieldController = TextEditingController();
  TextEditingController newPasswordFieldController = TextEditingController();
  TextEditingController cNewPasswordFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forgot Password'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Obx(
        () => changePasswordScreenController.isLoading.value
            ? customCircularProgressIndicator()
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: oldPasswordFieldController,
                        keyboardType: TextInputType.text,
                        decoration: inputDecoration('Old Password'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Old Password Field not Empty";
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: newPasswordFieldController,
                        keyboardType: TextInputType.text,
                        decoration: inputDecoration('New Password'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "New Password Field not Empty";
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        controller: cNewPasswordFieldController,
                        keyboardType: TextInputType.text,
                        decoration: inputDecoration('Confirm New Password'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Confirm New Password Field not Empty";
                          } else if (newPasswordFieldController.text !=
                              cNewPasswordFieldController.text) {
                            return "Password Not Match";
                          }
                        },
                      ),
                      const SizedBox(height: 25),
                      GestureDetector(
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            changePasswordScreenController.getForgotPasswordData(
                              "${oldPasswordFieldController.text.trim()}",
                              "${newPasswordFieldController.text.trim()}",
                              "${cNewPasswordFieldController.text.trim()}"
                            );
                            oldPasswordFieldController.clear();
                            newPasswordFieldController.clear();
                            cNewPasswordFieldController.clear();
                          }
                        },
                        child: Container(
                          width: Get.width,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Text(
                              'Submit',
                              textScaleFactor: 1.2,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: CustomColor.kTealColor,
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

  InputDecoration inputDecoration(hintText) {
    return InputDecoration(
      hintText: '$hintText',
      isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: BorderSide(color: Colors.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: BorderSide(color: Colors.grey),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(35),
        borderSide: BorderSide(color: Colors.grey),
      ),
    );
  }
}
