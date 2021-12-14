import 'package:flutter/cupertino.dart';

class Balance extends ChangeNotifier {
  double balance;

  Balance(this.balance);

  void add(double balance) {
    this.balance += balance;
    notifyListeners();
  }

  @override
  String toString() {
    return 'R\$ $balance';
  }
}
