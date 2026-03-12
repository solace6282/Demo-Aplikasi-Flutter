import 'package:flutter/material.dart';
import 'package:litest/app.dart';
import 'package:litest/global/screens.dart';

const homeScreen = 'homeScreen';
const productScreen = 'productScreen';
const cartScreen = 'cartScreen';
const loginScreen = 'loginScreen';
const checkTokenScreen = 'splashScreen';

Route controller(RouteSettings settings) {
  switch (settings.name) {
    case homeScreen:
      return MaterialPageRoute(builder: (context) => HomeScreen(),);
    case productScreen:
      return MaterialPageRoute(builder: (context) => ProductScreen(),);
    case cartScreen:
      return MaterialPageRoute(builder: (context) => CartScreen(),);
    case loginScreen:
      return MaterialPageRoute(builder: (context) => LoginScreen(),);
    case checkTokenScreen:
      return MaterialPageRoute(builder: (context) => CheckTokenScreen(),);
    default:
      throw "Route ${settings.name} not found";
  }
}