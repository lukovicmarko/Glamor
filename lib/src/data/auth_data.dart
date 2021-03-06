import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food/src/models/User.dart';
import 'package:food/src/modules/http.dart';
import 'package:localstorage/localstorage.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        image: signInResponse["image"] == null
            ? "assets/images/user.png"
            : signInResponse["image"],
      );

      _isLogged = true;

      //save to localstorage
      saveUserToLocalStorage(_user);
      saveLocalStorage(signInResponse["token"]);
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

      _user = new User(
        id: googleResponse.id,
        name: googleResponse.displayName,
        email: googleResponse.email,
        image: googleResponse.photoUrl,
      );

      //save to localstorage

      saveUserToLocalStorage(_user);

      storage.setItem('token', accessToken);

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  logoutWithGoogle() async {
    try {
      await _googleSignIn.signOut();

      _isLogged = false;

      storage.deleteItem('token');

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  saveLocalStorage(accessToken) {
    storage.setItem('token', accessToken);
  }

  getLocalStorage() async {
    await storage.ready;

    final token = storage.getItem("token");

    return token;
  }

  void saveUserToLocalStorage(User user) {
    final userInfo = json.encode({
      'id': user.id,
      'name': user.name,
      'email': user.email,
      'image': user.image,
    });
    storage.setItem('userInfo', userInfo);
  }

  void getUserFromLocalStorage() {
    Map<String, dynamic> info = json.decode(storage.getItem('userInfo'));

    _user = new User(
      id: info['id'],
      name: info['name'],
      email: info['email'],
      image: info['image'],
    );
  }

  Future register(name, email, password, imageFile) async {
    RequestResult requestResult =
        RequestResult('https://lukovicmarko-glamor.herokuapp.com/api/users');

    final signUpResponse = await requestResult.sendData({
      "name": name,
      "email": email,
      "password": password,
    });

    if (signUpResponse["message"] == null) {
      _user = new User(
        id: signUpResponse["_id"],
        name: signUpResponse["name"],
        email: signUpResponse["email"],
      );

      _isLogged = true;

      //save to localstorage
      saveLocalStorage(signUpResponse["token"]);
    } else {
      _message = signUpResponse["message"];
      _isLogged = false;
    }

    notifyListeners();
  }

  get message => _message;
  get user => _user;
  get isLogged => _isLogged;
  get googleSignIn => _googleSignIn;
}
