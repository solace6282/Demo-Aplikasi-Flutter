import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:litest/core/routes/routes.dart' as route;
import 'package:litest/global/cubits.dart';
import 'package:litest/global/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(GetIt.I.get<LoginService>()),),
        BlocProvider(create: (context) => ProductCubit(GetIt.I.get<ProductService>()),),
        BlocProvider(create: (context) => CartCubit(GetIt.I.get<CartService>()),),
        BlocProvider(create: (context) => CheckTokenCubit(GetIt.I.get<LoginService>())),
      ],
      child: MaterialApp(
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
        initialRoute: route.checkTokenScreen,
      ),
    );
  }
}