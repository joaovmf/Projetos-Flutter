import 'package:flutter/material.dart';
import '../models/balance.dart';
import 'package:provider/provider.dart';

class BalanceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Consumer<Balance>(
          builder: (context, balance, child) {
            return Text (balance.toString(),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),);
          },
        ),
      ),
    );
  }
}
