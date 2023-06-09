import 'package:get/get.dart';
import '../../model/user_list_response.dart';
import '../../service/user_list/user_list_service.dart';
import '../../utils/dialog_helper.dart';

class UserController extends GetxController{

  final String userType = "manager";

  List<UserListData> userList = [];

  @override
  void onReady() async{
    await getUserList();
    super.onReady();
  }


  Future getUserList() async {

    try {
      DialogHelper.showLoading();
      var response = await UserListService().requestUserList(userType);

      if (response != null) {
        var result = UserListResponse.fromJson(response);
        userList = result.data ?? [];
        DialogHelper.hideLoading();
        update();

      }

    } catch (exception) {
      DialogHelper.hideLoading();
      print(exception);
    }
  }

}