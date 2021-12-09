import 'package:flutter/material.dart';
import './screens/dashboard.dart';
import 'http/web_client.dart';

void main() { 
  runApp(BytebankApp());
  findAll().then((transactions) => print('new transations $transactions'));
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     theme: ThemeData(
        primaryColor: Colors.green.shade900,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.green.shade900,
          secondary: Colors.blueAccent.shade700,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.blueAccent.shade700),
          ),
        ),
      ),
      home: Dashboard(),
    );
  }
}

