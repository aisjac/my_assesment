import 'package:get/get.dart';
import '../../utils/dialog_helper.dart';

class UserController extends GetxController{

  final String userType = "admin";

  List<UserListData> userList = [];

  @override
  void onReady() async{
    await getUserList();
    super.onReady();
  }


  Future getUserList() async {

    try {
      var response = await UserListService().requestUserList(userType);

      if (response != null) {
        var result = UserListResponse.fromJson(response);
        userList = result.data ?? [];
        update();
      }

    } catch (exception) {
      DialogHelper.hideLoading();
      print(exception);
    }
  }

}