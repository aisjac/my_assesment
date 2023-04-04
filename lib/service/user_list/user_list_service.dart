import '../../networking/api_urls.dart';
import '../../networking/dio_client.dart';
import 'i_user_list_service.dart';

class UserListService with IUserListService {

  @override
  Future requestUserList(String userType) async {
    var response = await DioClient().get(url: ApiUrl.userListUrl(userType));
    return response;
  }

}