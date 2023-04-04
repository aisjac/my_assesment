import '../../model/login_dm.dart';

abstract class IAuthService {
  Future<dynamic> requestForLogIn(LogInRequestDm request);

}
