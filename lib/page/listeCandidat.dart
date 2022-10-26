/*import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:app/main.dart';
import 'package:http/http.dart' as http;
import 'delayed_animation.dart';

class ListCandidat  {
  String baseUrl = "http://localhost:8000/api/users";  Future<List> getAllCandidat() async {
    try{
      var response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      }else {
        return Future.error("server Error");
      }
    }
  }
  
}*/
