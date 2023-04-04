
import '../../model/login_dm.dart';
import '../../networking/api_urls.dart';
import '../../networking/dio_client.dart';
import 'i_auth_service.dart';

class AuthService with IAuthService {


  @override
  Future requestForLogIn(LogInRequestDm request) async {
    try {
      var response = await DioClient().post(
        url: ApiUrl.logInUrl,
        body: request,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

}
