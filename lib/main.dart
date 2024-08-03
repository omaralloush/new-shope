import 'package:flutter/material.dart';
import 'package:new_shope/services/api/api.dart';
import 'package:new_shope/services/providers/helper_provider.dart';
import 'package:provider/provider.dart';

import './core/theme/app_theme.dart';
import './core/router/app_router.dart';
import '../../core/helpers/check_first_time.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isFirstTime = await CheckFirstTime.getfiresTimeOpining();
  var c = await MainApi.getProducts(5, 5);
  // debugPrint(c.toString());
  // debugPrint('$isFirstTime');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => HelperProvider(firesTimeOpiningF: isFirstTime))
    ],
    child: const NewShopeApp(),
  ));
}

class NewShopeApp extends StatelessWidget {
  const NewShopeApp({super.key});
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'New Shope',
    //   theme: AppTheme.lightTheme,
    //   home: const RegisterScreen(),
    // );

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'New Shope',
        theme: AppTheme.lightTheme,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRouter.splashScreen);
  }
}
