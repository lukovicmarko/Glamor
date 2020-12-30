import 'package:flutter/material.dart';
import 'package:food/src/modules/http.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:convert';

class AuthData extends ChangeNotifier {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: <String>[
      'email',
    ],
  );

  final String apiUrl = FlutterConfig.get('API_URL');
  final LocalStorage storage = new LocalStorage('localstorage_app');

  bool _isLogged = false;
  var _userInfo;

  Future login(email, password) async {
    RequestResult requestResult =
        //RequestResult('https://proshop1986.herokuapp.com/api/users/login');
        RequestResult(
            'https://lukovicmarko-glamor.herokuapp.com/api/users/login');

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

  void loginWithGoogle() async {
    try {
      await _googleSignIn.signIn();

      _isLogged = true;

      //save to localstorage
      final googleInfo = json.encode(_googleSignIn.currentUser);
      storage.setItem('googleInfo', googleInfo);

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void logoutWithGoogle() async {
    try {
      await _googleSignIn.signOut();

      _isLogged = false;

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  get userInfo => _userInfo;
  get isLogged => _isLogged;
  get googleSignIn => _googleSignIn;
}
