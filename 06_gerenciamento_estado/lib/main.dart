import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/dashboard.dart';
import './models/balance.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Balance(0))],
      child: MaterialApp(
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
      ),
    );
  }
}
