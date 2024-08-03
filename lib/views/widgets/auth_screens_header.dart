import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_shope/views/widgets/fade_animation.dart';
import '../../core/helpers/screen_size_calc.dart';

class AuthScreensHeader extends StatelessWidget {
  final String logo;
  final String title;
  final String body;
  const AuthScreensHeader({
    super.key,
    required this.logo,
    required this.title,
    required this.body,
  });
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
        1.3,
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // const FadeAnimation(
                  //     1,
                  Text(
                    title,
                    style: const TextStyle(color: Colors.white, fontSize: 38),
                  ),
                  // ),
                  SizedBox(
                    height: ScreenSizeCalc.getHeightByRatio(context, 0.01),
                  ),
                  // const FadeAnimation(
                  //     1.3,
                  Text(
                    body,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  )
                  // ),
                ],
              ),
              SizedBox(width: ScreenSizeCalc.getWidthByRatio(context, 0.2)),
              SvgPicture.asset(logo,
                  width: ScreenSizeCalc.getWidthByRatio(context, 0.3)),
            ],
          ),
        ));
  }
}
