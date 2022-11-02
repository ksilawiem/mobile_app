import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mobile_app/api/api_models/user.dart';
import 'package:mobile_app/api/authservice.dart';

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
    // dio.FormData formData = new dio.FormData.fromMap(loginData);

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Authservice apiService = Authservice(dio.Dio());
    var response;
    try {
      response = await apiService.login(loginData);
      print('${response.toJson()}');
      if (response.message != 'Success') {
        User authUser = User(
          id: response.user?.id,
          firstName: response.user?.firstName,
          lastName: response.user?.lastName,
          email_verified: response.user?.email_verified,
          gender: response.user?.gender,
          birthdate: response.user?.birthdate,
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

  Future<Map<String, dynamic>> createUser(Map<String, dynamic> bodyData) async {
    var result;

    // dio.FormData formData = new dio.FormData.fromMap(loginData);

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Authservice apiService = Authservice(dio.Dio());
    var response;
    try {
      response = await apiService.createUser(
          bodyData['firstName'],
          bodyData['lastName'],
          bodyData['email'],
          bodyData['password'],
          bodyData['address'],
          bodyData['birthDate'],
          bodyData['city'],
          bodyData['company'],
          bodyData['gender'] ///////
          );
      print('${response.toJson()}');
      if (response.message == 'candidat created') {
        print("user created");
        _loggedInStatus = Status.LoggedIn;
        notifyListeners();

        result = {'status': true, 'message': 'Successful'};
      } else {
        _loggedInStatus = Status.NotLoggedIn;
        notifyListeners();
        result = {'status': false, 'message': 'Failed not created'};
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
}
