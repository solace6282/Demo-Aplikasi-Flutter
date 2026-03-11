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
        // scaffoldBackgroundColor: Colors.white,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.black12)
          )
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 16
          ),
        )
      ),
      onGenerateRoute: route.controller,
      initialRoute: route.loginScreen,
    );
  }
}