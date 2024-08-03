import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:introduction_slider/introduction_slider.dart';
import 'package:new_shope/services/providers/helper_provider.dart';
import 'package:new_shope/views/screens/authentication/login_screen.dart';
import 'package:provider/provider.dart';
import '../../core/helpers/screen_size_calc.dart';
import '../../core/router/app_router.dart';
import '../../core/constants/images.dart';
import '../../core/constants/strings.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  @override
  initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
//this will start the animation
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool firstTimeOpining =
        Provider.of<HelperProvider>(context).firesTimeOpining;
    // debugPrint("$firstTimeOpining");
    if (!firstTimeOpining) {
      Future.delayed(
        const Duration(seconds: 4),
        () {
          Navigator.pushReplacementNamed(context, AppRouter.wrapper);
        },
      );
    }
    return Scaffold(
      body: Center(
        child: firstTimeOpining
            ? IntroductionSlider(
                items: ImagesAssetPath.sliderImages
                    .asMap()
                    .map((i, image) => MapEntry(
                        i,
                        introSliderItem(
                            context: context,
                            imagePath: image,
                            text: Strings.sliderImageTexts[i])))
                    .values
                    .toList(),
                back: const Back(
                  child: IntroSliderButtonIcon(iconData: Icons.arrow_back),
                ),
                next: const Next(
                  child: IntroSliderButtonIcon(iconData: Icons.arrow_forward),
                ),
                dotIndicator: const DotIndicator(),
                done: const Done(
                  child: IntroSliderButtonIcon(iconData: Icons.check),
                  home: LoginScreen(),
                ),
              )
            : FadeTransition(
                opacity: animation,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      ImagesAssetPath.logo,
                      width: ScreenSizeCalc.getWidthByRatio(context, 0.7),
                    ),
                    Text(
                      'Welcome Back',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textScaler: TextScaler.linear(
                          ScreenSizeCalc.textScaleFactor(context)),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  IntroductionSliderItem introSliderItem(
      {required context, required String imagePath, required String text}) {
    return IntroductionSliderItem(
      title: Column(
        children: [
          Image.asset(imagePath,
              width: ScreenSizeCalc.getWidthByRatio(context, 0.7)),
          SizedBox(
            width: ScreenSizeCalc.getWidthByRatio(context, 0.8),
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

class IntroSliderButtonIcon extends StatelessWidget {
  final IconData iconData;
  const IntroSliderButtonIcon({super.key, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ScreenSizeCalc.getWidthByRatio(context, 0.05)),
      child: Icon(iconData, size: 40),
    );
  }
}
