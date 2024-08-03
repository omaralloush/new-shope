// ignore_for_file: use_build_context_synchronously, library_prefixes

import 'package:flutter/material.dart';
import 'package:new_shope/data/models/user/user_model.dart';
import 'package:new_shope/services/api/api.dart';
import 'package:new_shope/views/screens/authentication/login_screen.dart';
import '../../../core/constants/colors.dart' as AppColor;
import '../../../core/constants/images.dart';
import '../../../core/router/app_router.dart';
import '../../widgets/auth_screens_header.dart';
import '../../widgets/fade_animation.dart';
import '../../widgets/custom_form_textfeild.dart';
import '../../widgets/custom_form_button.dart';
import '../../../core/helpers/show_snack_bar.dart';
import '../../../core/helpers/screen_size_calc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'dart:async';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
    /*@required this.savedThemeMode*/
  });

  @override
  State<RegisterScreen> createState() => _SignInScreen();
}

class _SignInScreen extends State<RegisterScreen> {
  String? firstName;
  String? lastName;
  String? userName;
  String? password;
  // UserModel user = UserModel();
  bool inAsyncCall = false;

  GlobalKey<FormState> formKey = GlobalKey();

  RegExp regExp = RegExp('[^A-Za-z0-9]+');
  RegExp nameRegExp = RegExp('[^A-Za-z]+');
  String messege = '';
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
              SizedBox(
                height: ScreenSizeCalc.getHeightByRatio(context, 0.05),
              ),
              const AuthScreensHeader(
                logo: ImagesAssetPath.logo,
                title: 'Register',
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
                                          hint: 'First Name',
                                          validator: nameValidator,
                                          onChanged: (value) =>
                                              firstName = value),
                                      CustomFormTextField(
                                          hint: 'Last Name',
                                          validator: nameValidator,
                                          onChanged: (value) =>
                                              lastName = value),
                                      CustomFormTextField(
                                          hint: 'User Name',
                                          validator: userNameValidator,
                                          onChanged: (value) =>
                                              userName = value),
                                      CustomFormTextField(
                                        hint: 'Password',
                                        validator: passwordValidator,
                                        onChanged: (value) => password = value,
                                      )
                                    ],
                                  ),
                                )),
                            sizedBoxH02,
                            FadeAnimation(
                                1.6,
                                CustomFormButton(
                                  onTap: () async {
                                    // MainApi.register(UserModel());
                                    setState(() {
                                      inAsyncCall = true;
                                    });
                                    if (formKey.currentState!.validate()) {
                                      FocusScope.of(context)
                                          .requestFocus(FocusNode());
                                      Timer(const Duration(seconds: 25), () {
                                        if (inAsyncCall == true) {
                                          setState(() {
                                            inAsyncCall = false;
                                          });
                                          showSnackBar(context,
                                              'Long Time Check Your Internet');
                                        }
                                      });
                                      try {
                                        await MainApi.register(UserModel(
                                            firstName: firstName!,
                                            lastName: lastName!,
                                            userName: userName!,
                                            token: password!));
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const LoginScreen()));
                                      } catch (e) {
                                        messege = e
                                            .toString()
                                            .replaceFirst('Exception:', '');
                                        showSnackBar(context, messege);
                                      }
                                    } else {
                                      showSnackBar(
                                          context, 'Please Check your inputs');
                                    }
                                    setState(() {
                                      inAsyncCall = false;
                                      messege = '';
                                    });
                                  },
                                  text: Text(
                                    'Register',
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
                                Text("You have account!",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 68, 68, 68),
                                        fontSize: 18))),
                            sizedBoxH01,
                            FadeAnimation(
                              1.9,
                              CustomFormButton(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const LoginScreen()));
                                },
                                text: Text('Login', style: textStyle),
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
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Skip Now'),
                                    Icon(
                                      Icons.arrow_forward,
                                      size: 18,
                                    )
                                  ],
                                ),
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, AppRouter.home);
                                },
                              ),
                            ),
                            sizedBoxH02,
                            // Row(
                            //   children: <Widget>[
                            //     Expanded(
                            //         child: FadeAnimation(
                            //             1.8,
                            //             CustomFormButton(
                            //                 onTap: () {},
                            //                 text: Text(
                            //                   'Facebook',
                            //                   style: textStyle,
                            //                 ),
                            //                 color: const Color(0xff4267B2),
                            //                 size: Size(
                            //                     ScreenSizeCalc.getWidthByRatio(
                            //                         context, 0.44),
                            //                     ScreenSizeCalc.getHeightByRatio(
                            //                         context, 0.05))))),
                            //     SizedBox(width: 600 * 0.1),
                            //     Expanded(
                            //       child: FadeAnimation(
                            //           1.9,
                            //           CustomFormButton(
                            //               onTap: () {},
                            //               text:
                            //                   Text('Github', style: textStyle),
                            //               color: Colors.black,
                            //               size: Size(
                            //                   ScreenSizeCalc.getWidthByRatio(
                            //                       context, 0.44),
                            //                   ScreenSizeCalc.getHeightByRatio(
                            //                       context, 0.05)))),
                            //     )
                            //   ],
                            // )
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
    if (messege.isNotEmpty) {
      return messege;
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
    if (messege.isNotEmpty) {
      return messege;
    }
    return null;
  }

  String? nameValidator(value) {
    if (value!.isEmpty) {
      return 'Empty Field';
    }
    if (nameRegExp.hasMatch(value)) {
      return 'Invalid Name';
    }
    if (value.length < 3) {
      return 'Short Name';
    }
    if (messege.isNotEmpty) {
      return messege;
    }
    return null;
  }
}
