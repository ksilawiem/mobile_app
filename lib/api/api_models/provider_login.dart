import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile_app/api/api_models/user.dart';
import 'package:mobile_app/api/service.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class ProviderLogin extends ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
    
  }

  Status get registeredInStatus => _registeredInStatus;

  set registeredInStatus(Status value) {
    _registeredInStatus = value;
  }

  notify() {
    notifyListeners();
  }

   Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    final Map<String, dynamic> loginData = {
      'email': email,
      'password': password
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Service apiService = Service(dio.Dio());
    var response;
    try {
      response = await apiService.login(loginData);
      print('${response.toJson()}');
      if (response.message != 'Success') {
        User authUser = User(
           id: response.user?.id,
          firstName: response.user?.firstName,
          lastName: response.user?.lastName,
          email_verified: response.user?.email,
          gender: response.user?.phoneNumber,
          birthdate: response.user?.birthday,
          role: response.user?.role,
        );
        _loggedInStatus = Status.LoggedIn;
        notifyListeners();

        result = {'status': true, 'message': 'Successful', 'user': authUser};
      } else {
        _loggedInStatus = Status.NotLoggedIn;
        notifyListeners();
        result = {'status': false, 'message': 'Failed', 'user': ''};
      }
    } on dio.DioError catch (e) {
      if (e.response?.statusCode == 401) {
        //print("Unathorized");
        _loggedInStatus = Status.NotLoggedIn;
        notifyListeners();
        result = {'status': false, 'message': 'Unauthorized'};
      } else {
        _loggedInStatus = Status.NotLoggedIn;
        notifyListeners();
         result = {'status': false, 'message': e.message};
        print(' This is the error ${e.message}');
      }
    }
    return result;
  }

  static onError(error) {
    print('the error is ${error.detail}');
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}


