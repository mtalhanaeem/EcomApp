import 'package:ecom_app/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Shopping App",
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromRGBO(254, 206, 1, 1),
          primary: Color.fromRGBO(254, 206, 1, 1),
          secondary: Color.fromRGBO(245, 247, 249, 1),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Color.fromRGBO(119, 119, 119, 1),
          ),
          prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
        ),
        textTheme: TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
