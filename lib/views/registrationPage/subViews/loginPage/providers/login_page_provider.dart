import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../controllers/apiService/api_services.dart';
import '../../../../../controllers/toggleMsg/toggle_msg.dart';
import '../../../../../models/login_success_model.dart';

class LoginPageProvider extends ChangeNotifier {
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  final ApiService _apiService = ApiService();
  LogInSuccessModel _logInSuccessModel = LogInSuccessModel();
  bool _rememberMe = false;
  bool _canNavigate = false;

  bool get canNavigate => _canNavigate;

  bool get rememberMe => _rememberMe;

  TextEditingController get name => _name;

  TextEditingController get password => _password;

  LogInSuccessModel get logInSuccessModel => _logInSuccessModel;

  void setRememberMe({required bool value}) {
    _rememberMe = value;
    notifyListeners();
  }

  Future<void> setSignIn() async {
    final data = {
      "email": _name.text,
      "password": _password.text,
    };
    _logInSuccessModel =
        await _apiService.loginUsers(url: '/authaccount/login', data: data);
    if (_logInSuccessModel.data != null) {
      AlertServices.alertServices
          .toggleSms(msg: _logInSuccessModel.message!, color: Colors.green);
      _canNavigate = true;
    } else {
      AlertServices.alertServices
          .toggleSms(msg: _logInSuccessModel.message!, color: Colors.red);
    }
    notifyListeners();
  }
}
