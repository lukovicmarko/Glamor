import 'package:flutter/material.dart';
import 'package:food/src/models/User.dart';
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
  String _message;
  User _user;

  Future login(email, password) async {
    RequestResult requestResult = RequestResult(
        'https://lukovicmarko-glamor.herokuapp.com/api/users/login');

    final signInResponse = await requestResult.sendData({
      "email": email,
      "password": password,
    });

    if (signInResponse["message"] == null) {
      _user = new User(
        id: signInResponse["_id"],
        name: signInResponse["name"],
        email: signInResponse["email"],
      );

      _isLogged = true;

      //save to localstorage
      final token = json.encode(_user);
      storage.setItem('token', token);
    } else {
      _message = signInResponse["message"];
      _isLogged = false;
    }

    notifyListeners();
  }

  loginWithGoogle() async {
    try {
      final googleResponse = await _googleSignIn.signIn();

      _isLogged = true;

      final response = await googleResponse.authentication;
      final accessToken = response.accessToken;

      //save to localstorage
      final googleToken = json.encode(accessToken);
      storage.setItem('googleToken', googleToken);

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  logoutWithGoogle() async {
    try {
      await _googleSignIn.signOut();

      _isLogged = false;

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  get message => _message;
  get user => _user;
  get isLogged => _isLogged;
  get googleSignIn => _googleSignIn;
}
