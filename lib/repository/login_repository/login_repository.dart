import '../../data/network/network_api_services.dart';
import '../../models/login/user_model.dart';
import '../../res/app_url/app_url.dart';

class LoginRepository {
  final _apiService = NetworkApiServices();

  Future<UserModel> loginApi(var data) async {
    dynamic response =
        await _apiService.postApi(data, AppUrl.login);
    return UserModel.fromJson(response);
  }
}
