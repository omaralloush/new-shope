import 'package:flutter/material.dart';

class HelperProvider with ChangeNotifier {
  bool firesTimeOpiningF;
  HelperProvider({required this.firesTimeOpiningF});
  bool get firesTimeOpining => firesTimeOpiningF;
  set firesTimeOpining(bool firesTimeOpining) {
    firesTimeOpining = firesTimeOpining;
    notifyListeners();
  }
}
