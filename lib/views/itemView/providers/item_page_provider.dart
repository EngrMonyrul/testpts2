import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:testpts/controllers/apiService/api_services.dart';
import 'package:testpts/models/user_data_model.dart';

class ItemPageProvider extends ChangeNotifier {
  bool _editName = false;
  TextEditingController _name = TextEditingController();
  ApiService apiService = ApiService();

  TextEditingController get name => _name;

  bool get editName => _editName;

  void updateItem(
      {required UserData userData, required String bearerToken}) async {
    print(userData.toJson());
    final data = {
      "id": userData.id,
      "name": _name.text,
      "email": userData.email,
      "profilepicture": userData.profilepicture,
      "location": userData.location,
      "createdat": userData.createdat
    };
    final resData = await apiService.updateUser(
        url: "/users/${userData.id}", bearerToken: bearerToken, data: data);
    print(resData);
  }

  void setNamePermission() {
    if (_editName) {
      _editName = false;
      _name.clear();
    } else {
      _editName = true;
    }
    notifyListeners();
  }
}
