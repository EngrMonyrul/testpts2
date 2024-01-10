import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../../controllers/apiService/api_services.dart';
import '../../../../../controllers/toggleMsg/toggle_msg.dart';
import '../../../../../models/login_success_model.dart';

class SignupPageProvider extends ChangeNotifier {
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  TextEditingController _email = TextEditingController();
  final ApiService _apiService = ApiService();
  LogInSuccessModel _logInSuccessModel = LogInSuccessModel();
  bool _rememberMe = false;
  bool _canNavigate = false;

  bool get canNavigate => _canNavigate;

  bool get rememberMe => _rememberMe;

  TextEditingController get name => _name;

  TextEditingController get password => _password;

  TextEditingController get confirmPassword => _confirmPassword;

  TextEditingController get email => _email;

  LogInSuccessModel get logInSuccessModel => _logInSuccessModel;


  void setRememberMe({required bool value}) {
    _rememberMe = value;
    notifyListeners();
  }

  Future<void> setSignUp() async {
    if (_password.text == _confirmPassword.text) {
      final data = {
        "name": _name.text,
        "email": _email.text,
        "password": _password.text,
      };
      _logInSuccessModel = await _apiService.signupUsers(
          url: '/authaccount/registration', data: data);
      if (_logInSuccessModel.data != null) {
        AlertServices.alertServices
            .toggleSms(msg: _logInSuccessModel.message!, color: Colors.green);
        _canNavigate = true;
      } else {
        AlertServices.alertServices
            .toggleSms(msg: _logInSuccessModel.message!, color: Colors.red);
      }
    } else {
      AlertServices.alertServices
          .toggleSms(msg: "Password didn't matched", color: Colors.red);
    }
    notifyListeners();
  }
}
