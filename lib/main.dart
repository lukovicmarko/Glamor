import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:food/src/data/auth_data.dart';
import 'package:localstorage/localstorage.dart';
import 'src/glamor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  var authData = new AuthData();
  var token = await authData.getLocalStorage();

  runApp(Glamor(token: token));
}
