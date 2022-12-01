import 'package:flutter/material.dart';
import 'package:localpath/resource/color/BaseColors.dart';

class AppColors implements BaseColors {
  final Map<int, Color> _primary = {
    50: const Color.fromRGBO(22, 134, 206, 0.1),
    100: const Color.fromRGBO(22, 134, 206, 0.2),
    200: const Color.fromRGBO(22, 134, 206, 0.3),
    300: const Color.fromRGBO(22, 134, 206, 0.4),
    400: const Color.fromRGBO(22, 134, 206, 0.5),
    500: const Color.fromRGBO(22, 134, 206, 0.6),
    600: const Color.fromRGBO(22, 134, 206, 0.7),
    700: const Color.fromRGBO(22, 134, 206, 0.8),
    800: const Color.fromRGBO(22, 134, 206, 0.9),
    900: const Color.fromRGBO(22, 134, 206, 1.0),
  };

  @override
  MaterialColor get colorAccent => Colors.amber;

  @override
  MaterialColor get colorPrimary => MaterialColor(0xff1686ce, _primary);

  @override
  Color get colorPrimaryText => const Color(0xff49ABFF);

  @override
  Color get colorSecondaryText => const Color(0xff3593FF);

  @override
  Color get colorWhite => const Color(0xffffffff);

  @override
  Color get colorBlack => const Color(0xff000000);

  @override
  Color get castChipColor => Colors.deepOrangeAccent;

  @override
  Color get catChipColor => Colors.indigoAccent;

  @override
  Color get colorMediumBlue => const Color.fromRGBO(35, 208, 206, 1.0);
  //Color get colorMediumBlue => const Color.fromRGBO(143, 148, 251, 1.0);
  //Color get colorMediumBlue => const Color.fromRGBO(191, 90, 242, 1.0);//Purpel
  //Color get colorMediumBlue => const Color.fromRGBO(100, 210, 255, 1.0); //SysteTeal
  //Color get colorMediumBlue => const Color.fromRGBO(255, 55, 95, 1.0); //pink
  //Color get colorMediumBlue => const Color.fromRGBO(255, 149, 0, 1.0); //orange
}