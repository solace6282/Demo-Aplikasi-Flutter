import 'package:flutter/material.dart';
import 'package:litest/core/routes/routes.dart' as route;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      onGenerateRoute: route.controller,
      initialRoute: route.loginScreen,
    );
  }
}