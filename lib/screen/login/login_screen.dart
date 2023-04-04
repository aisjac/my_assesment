import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../custom_widget/custom_button.dart';
import '../../custom_widget/custom_password_textfield.dart';
import '../../custom_widget/custom_textfield.dart';
import 'login_controller.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: Colors.blueGrey,
            body: Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 25.0,right: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                        hintText: 'Email',
                        controller: controller.emailController),
                    const SizedBox(height: 10),
                    CustomPasswordTextField(
                        hintText: 'Password',
                        controller: controller.passController),
                    const SizedBox(height: 10),
                    CustomButton(
                      text: 'Sign Up',
                      onTap: () {
                        if (controller.validation()) {
                          controller.submitSignIn();
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
