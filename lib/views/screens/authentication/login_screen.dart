// ignore_for_file: library_prefixes, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:new_shope/core/error/exceptions.dart';
import 'package:new_shope/core/router/app_router.dart';
import 'package:new_shope/services/api/api.dart';
import 'package:new_shope/views/screens/authentication/register_screen.dart';
import '../../../core/constants/colors.dart' as AppColor;
import '../../../core/constants/images.dart';
import '../../widgets/auth_screens_header.dart';
import '../../widgets/fade_animation.dart';
import '../../widgets/custom_form_textfeild.dart';
import '../../widgets/custom_form_button.dart';
import '../../../core/helpers/show_snack_bar.dart';
import '../../../core/helpers/screen_size_calc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'dart:async';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    /*@required this.savedThemeMode*/
  });

  @override
  State<LoginScreen> createState() => _SignInScreen();
}

class _SignInScreen extends State<LoginScreen> {
  late String _userName;
  late String _password;
  bool inAsyncCall = false;
  bool _isInvalidCredentials = false;
  // bool _isLoggedIn = false;
  GlobalKey<FormState> formKey = GlobalKey();

  RegExp regExp = RegExp('[^A-Za-z0-9]+');
  var textStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20);
  @override
  Widget build(BuildContext context) {
    final sizedBoxH01 =
        SizedBox(height: ScreenSizeCalc.getHeightByRatio(context, 0.01));
    final sizedBoxH02 =
        SizedBox(height: ScreenSizeCalc.getHeightByRatio(context, 0.02));
    return ModalProgressHUD(
      inAsyncCall: inAsyncCall,
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(gradient: AppColor.backgroundGradientLight),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: ScreenSizeCalc.getHeightByRatio(context, 0.05)),
              const AuthScreensHeader(
                logo: ImagesAssetPath.logo,
                title: 'Login',
                body: 'Welcome Back',
              ),
              sizedBoxH02,
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            sizedBoxH02,
                            FadeAnimation(
                                1.4,
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                            color: Color.fromRGBO(
                                                13, 56, 95, 0.38),
                                            blurRadius: 20,
                                            offset: Offset(0, 10))
                                      ]),
                                  child: Column(
                                    children: <Widget>[
                                      CustomFormTextField(
                                          hint: 'User Name',
                                          validator: userNameValidator,
                                          onChanged: (value) =>
                                              _userName = value),
                                      CustomFormTextField(
                                        hint: 'Password',
                                        validator: passwordValidator,
                                        onChanged: (value) => _password = value,
                                      )
                                    ],
                                  ),
                                )),
                            sizedBoxH02,
                            FadeAnimation(
                                1.6,
                                CustomFormButton(
                                  onTap: () async {
                                    setState(() {
                                      inAsyncCall = true;
                                    });
                                    if (formKey.currentState!.validate()) {
                                      formKey.currentState!.save();
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      Timer(const Duration(seconds: 25), () {
                                        if (mounted) {
                                          setState(() {
                                            inAsyncCall = false;
                                          });
                                          showSnackBar(context,
                                              'Long Time Check Your Internet');
                                        }
                                      });
                                      try {
                                        await MainApi.login(
                                            _userName, _password);
                                        showSnackBar(
                                            context, 'Login sucsessfully');
                                        Navigator.pushReplacementNamed(
                                            context, AppRouter.wrapper);
                                      } on ApiExeption catch (e) {
                                        if (mounted) {
                                          setState(() {
                                            _isInvalidCredentials = true;
                                            inAsyncCall = false;
                                            showSnackBar(context, e.message);
                                          });
                                        }
                                      } catch (e) {
                                        showSnackBar(context, e.toString());
                                      } finally {}
                                    } else {
                                      showSnackBar(
                                          context, 'Please Check your inputs');
                                    }
                                    setState(() {
                                      inAsyncCall = false;
                                    });
                                  },
                                  text: Text(
                                    'Login',
                                    style: textStyle,
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  size: Size(
                                      ScreenSizeCalc.getWidthByRatio(
                                          context, 0.7),
                                      ScreenSizeCalc.getHeightByRatio(
                                          context, 0.06)),
                                )),
                            sizedBoxH01,
                            const FadeAnimation(
                              1.5,
                              Text(
                                "Don't have account!",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 68, 68, 68),
                                    fontSize: 18),
                              ),
                            ),
                            sizedBoxH01,
                            FadeAnimation(
                              1.9,
                              CustomFormButton(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const RegisterScreen(),
                                    ),
                                  );
                                },
                                text: Text('Register', style: textStyle),
                                color: Theme.of(context).primaryColor,
                                size: Size(
                                    ScreenSizeCalc.getWidthByRatio(
                                        context, 0.44),
                                    ScreenSizeCalc.getHeightByRatio(
                                        context, 0.05)),
                              ),
                            ),
                            FadeAnimation(
                              1.6,
                              TextButton(
                                child: const Text('Skip Now'),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, AppRouter.wrapper);
                                },
                              ),
                            )
                            /*Row(
                              children: <Widget>[
                                Expanded(
                                    child: FadeAnimation(
                                        1.8,
                                        LoginButton(
                                            onTap: () {},
                                            text: Text(
                                              'Facebook',
                                              style: textStyle,
                                            ),
                                            color: const Color(0xff4267B2),
                                            size: size2))),
                                SizedBox(
                                  width: screenWidth * 0.1,
                                ),
                                Expanded(
                                  child: FadeAnimation(
                                      1.9,
                                      LoginButton(
                                          onTap: () {},
                                          text:
                                              Text('Github', style: textStyle),
                                          color: Colors.black,
                                          size: size2)),
                                )
                              ],
                            )*/
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  String? passwordValidator(value) {
    if (value!.isEmpty) {
      return 'Empty Field';
    }
    if (regExp.hasMatch(value)) {
      return 'Invalid Password';
    }
    if (value.length < 6) {
      return 'Short Password';
    }
    if (_isInvalidCredentials) {
      _isInvalidCredentials = false;
      return 'Invalid credentials';
    }
    return null;
  }

  String? userNameValidator(value) {
    if (value!.isEmpty) {
      return 'Empty Field';
    }
    if (regExp.hasMatch(value)) {
      return 'Invalid User Name';
    }
    if (value.length < 6) {
      return 'Short User Name';
    }
    if (_isInvalidCredentials) {
      _isInvalidCredentials = false;
      return 'Invalid credentials';
    }
    return null;
  }
}
