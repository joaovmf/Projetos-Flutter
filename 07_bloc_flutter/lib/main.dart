import 'package:bloc_flutter/components/theme.dart';
/* import 'package:bloc_flutter/screens/counter.dart'; exemplo */
import 'package:flutter/material.dart';
import './screens/dashboard.dart';
import './screens/name.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() { 
  runApp(BytebankApp());
}

class LogObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change){
    print("${bloc.runtimeType} > $change");
    super.onChange(bloc, change);
  }
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //na pratica evitar isso para nao vazer informacoes sensiveis.
    /* Bloc.observer = LogObserver(); */
    return MaterialApp(
     theme: bytebankTheme,
      home: DashboardContainer(),
    );
  }
}

