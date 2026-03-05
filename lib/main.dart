import 'package:flutter/material.dart';
import 'package:litest/app.dart';
import 'package:litest/core/di/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  DependencyInjection.init();
  runApp(const MyApp());
}