import 'package:shared_preferences/shared_preferences.dart';

class CheckFirstTime {
  static Future<bool> getfiresTimeOpining() async {
    bool firesTimeOpining;
    final prefs = await SharedPreferences.getInstance();
    firesTimeOpining = prefs.getBool('firstTimeOpining') ?? true;
    firesTimeOpining ? prefs.setBool("firstTimeOpining", false) : null;
    return firesTimeOpining;
  }
}
