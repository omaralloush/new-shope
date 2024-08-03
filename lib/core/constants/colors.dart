import 'package:flutter/material.dart';

Color kLightBackgroundColor = const Color(0xffFAFFAF);
Color kBackgroundColor = Colors.white;
Color kLightPrimaryColor = const Color(0xff0F67B1);
Color kLightSecondaryColor = const Color(0xff040415);
Color kLightParticlesColor = const Color(0xff3FA2F6);
Color kLightTextColor = Colors.black54;
LinearGradient backgroundGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    // transform: GradientRotation(0.1),
    colors: [
      kLightPrimaryColor.withAlpha(175),
      kLightPrimaryColor.withAlpha(175),
      kLightPrimaryColor.withAlpha(200),
      kLightPrimaryColor.withAlpha(225),
      kLightPrimaryColor.withAlpha(255),
      kLightPrimaryColor.withAlpha(255),
      kLightPrimaryColor.withAlpha(255),
      kLightPrimaryColor.withAlpha(255),
      kLightPrimaryColor.withAlpha(225),
      kLightPrimaryColor.withAlpha(200),
      kLightPrimaryColor.withAlpha(175),
      kLightPrimaryColor.withAlpha(175),
    ]);
// Color kDarkBackgroundColor = const Color(0xFF1A2127);
// Color kDarkPrimaryColor = const Color(0xFF1A2127);
// Color kDarkAccentColor = Colors.blueGrey.shade600;
// Color kDarkParticlesColor = const Color(0x441C2A3D);
// Color kDarkTextColor = Colors.white;
