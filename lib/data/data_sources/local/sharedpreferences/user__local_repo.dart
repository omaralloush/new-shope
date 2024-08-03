import 'dart:convert';

// import 'package:flutter/material.dart';
import 'package:new_shope/data/models/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepo {
  static Future<void> setUserData(UserModel user) async {
    var pref = await SharedPreferences.getInstance();
    pref.setString('userData', jsonEncode(user.toMap()));
    // debugPrint(jsonEncode(user.toMap()));
    // debugPrint(jsonDecode(pref.getString('userData') ?? '{}').toString());
    // user.toMap().forEach((key, value) {
    //   pref.setString(key, value);
    // });
    // pref.setStringList(user.toMap().keys.first, user.toMap().values.toList() as List<String>);
  }

  static Future<UserModel> gatUserData() async {
    var pref = await SharedPreferences.getInstance();

    return UserModel.fromMap(jsonDecode(pref.getString('userData') ?? '{}'));
  }
}
