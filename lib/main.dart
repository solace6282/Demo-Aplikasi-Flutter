import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:litest/app.dart';
import 'package:litest/core/di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  // dotenv.load(fileName: '.env');
  runApp(const MyApp());
}