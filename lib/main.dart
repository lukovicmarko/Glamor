import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:food/src/data/auth_data.dart';
import 'src/glamor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();

  final authData = new AuthData();
  final token = await authData.getLocalStorage();

  runApp(Glamor(token: token));
}
