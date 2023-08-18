import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _count = 100;
  int get counter => _count;
  void add() {
    _count++;
    notifyListeners();
  }
}
