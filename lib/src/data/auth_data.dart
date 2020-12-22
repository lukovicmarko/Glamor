import 'package:flutter/material.dart';
import 'package:food/src/modules/http.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter_config/flutter_config.dart';
import 'dart:convert';

class AuthData extends ChangeNotifier {
  final String apiUrl = FlutterConfig.get('API_URL');
  final LocalStorage storage = new LocalStorage('localstorage_app');

  var _userInfo;

  Future login(email, password) async {
    RequestResult requestResult =
        //RequestResult('https://proshop1986.herokuapp.com/api/users/login');
        RequestResult('$apiUrl/api/users/login');

    var signInResponse = await requestResult.sendData({
      "email": email,
      "password": password,
    });

    //print(signInResponse);
    _userInfo = signInResponse;

    //save to localstorage
    final info = json.encode(_userInfo);
    storage.setItem('info', info);

    notifyListeners();
  }

  get userInfo => _userInfo;
}
