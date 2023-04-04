import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../utils/custom_snackbar.dart';
import '../../utils/dialog_helper.dart';
import '../../utils/shared_preference.dart';

class LoginController extends GetxController{

  var emailController = TextEditingController();
  var passController = TextEditingController();



  bool validation() {

    if (emailController.text.isEmpty || emailController.text.trim() == '') {
      CustomSnackBar.showCustomErrorSnackBar(message: "Email can't be empty", title: "Error");
      return false;
    }
    if (passController.text.isEmpty || passController.text.trim() == '') {
      CustomSnackBar.showCustomErrorSnackBar(message: "Password can't be empty", title: "Error");
      return false;
    }
    return true;

  }

  void submitSignIn() async {
    var logInData = LogInRequestDm(
        email: emailController.text.trim(),
        password: passController.text.trim(),
    );


    DialogHelper.showLoading();
    try {
      var response = await AuthService().requestForLogIn(logInData);
      DialogHelper.hideLoading();
      update();
      if (response != null) {
        var result = LoginResponse.fromJson(response);

        if (result.code == 200) {

          CustomSnackBar.showCustomSnackBar(message: "${result.userMessage}", title: "Success");

          // token
          SharedPreferenceUtils.storeUserAccessToken(result.accessToken ?? "");
          print("Token : ${SharedPreferenceUtils.getUserAccessToken()}");

          // String imageUrl = result.data?.imageUrl ?? "";

          // image
          // SharedPreferenceUtils.storeUserImage(imageUrl);

          Get.offAll(() => const UserScreen());
        } else {
          DialogHelper.hideLoading();

          CustomSnackBar.showCustomErrorSnackBar(
              title: "Error", message: "${result.userMessage}");
        }
      }
    } catch (exception) {
      DialogHelper.hideLoading();
      print(exception);
    }
  }

}