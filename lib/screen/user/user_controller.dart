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

    DialogHelper.showLoading();
    try {
      var response = await UserListService().requestUserList(userType);

      if (response != null) {
        DialogHelper.hideLoading();
        update();
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