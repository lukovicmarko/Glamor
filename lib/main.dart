import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'src/glamor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  runApp(Glamor());
}
