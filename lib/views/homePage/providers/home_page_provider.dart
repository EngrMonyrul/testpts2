import 'package:flutter/foundation.dart';
import 'package:testpts/controllers/apiService/api_services.dart';
import 'package:testpts/models/user_model.dart';

class HomePageProvider extends ChangeNotifier {
  UserDetails _dataList = UserDetails();
  ApiService _apiService = ApiService();

  UserDetails get dataList => _dataList;

  Future<void> getAllData({required String userToken}) async {
    _dataList =
        await _apiService.getAllUsers(url: '/users', bearerToken: userToken);
    notifyListeners();
  }
}
