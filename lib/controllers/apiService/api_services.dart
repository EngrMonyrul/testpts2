import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:testpts/models/error_model.dart';
import 'package:testpts/models/login_response.dart';
import 'package:testpts/models/login_success_model.dart';
import 'package:testpts/models/user_model.dart';

import '../toggleMsg/toggle_msg.dart';

class ApiService {
  final String _baseUrl = 'http://restapi.adequateshop.com/api';

  loginUsers({required String url, required Map<String, dynamic> data}) async {
    try {
      final jsonData = json.encode(data);
      final response = await http.post(
        Uri.parse(_baseUrl + url),
        body: jsonData,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonBody = await json.decode(response.body.toString());
        LogInSuccessModel logInSuccessModel = LogInSuccessModel.fromJson(jsonBody);
        print(jsonBody);
        return logInSuccessModel;
      } else {
        AlertServices.alertServices.toggleSms(msg: 'Login Failed', color: Colors.red);
      }
    } catch (e) {
      rethrow;
    }
  }

  signupUsers({required String url, required Map<String, dynamic> data}) async {
    try {
      final jsonData = json.encode(data);
      final response = await http.post(
        Uri.parse(_baseUrl + url),
        body: jsonData,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonBody = await json.decode(response.body.toString());
        LogInSuccessModel logInSuccessModel =
            LogInSuccessModel.fromJson(jsonBody);
        return logInSuccessModel;
      } else {
        AlertServices.alertServices
            .toggleSms(msg: 'Invalid Url', color: Colors.red);
      }
    } catch (e) {
      rethrow;
    }
  }

  getAllUsers({required String url, required String bearerToken}) async {
    try {
      final response = await http.get(
        Uri.parse(_baseUrl + url),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $bearerToken',
        },
      );
      if (response.statusCode == 200) {
        final jsonBody = await json.decode(response.body.toString());
        UserDetails userDetails = UserDetails.fromJson(jsonBody);
        return userDetails;
      } else {
        AlertServices.alertServices
            .toggleSms(msg: 'Invalid Url', color: Colors.red);
      }
    } catch (e) {
      rethrow;
    }
  }

  updateUser(
      {required String url,
      required String bearerToken,
      required Map<String, dynamic> data}) async {
    try {
      final jsonData = json.encode(data);
      final response = await http.put(
        Uri.parse(_baseUrl + url),
        body: jsonData,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $bearerToken',
        },
      );
      if (response.statusCode == 200) {
        print(response.body.toString());
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<LoginResponse?> loginService({required Map<String, dynamic> data}) async {
    try {
      final jsonData = json.encode(data);
      final response = await http.post(
        Uri.parse('$_baseUrl/authaccount/login'),
        body: jsonData,
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        final jsonBody = await json.decode(response.body.toString());
        LoginResponse loginResponse = LoginResponse.fromJson(jsonBody);
        return loginResponse;
      } else {
        AlertServices.alertServices.toggleSms(msg: 'Login Failed', color: Colors.red);
      }
    } catch (e) {
      rethrow;
    }
  }
}
