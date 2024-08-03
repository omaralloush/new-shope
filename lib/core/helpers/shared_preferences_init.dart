import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesInit {
  Future<SharedPreferences> getInstancegetIns() async {
    return await SharedPreferences.getInstance();
  }
}
