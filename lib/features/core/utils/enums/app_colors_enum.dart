import 'package:flutter/material.dart';

enum AppColorsEnum {
  darkBlue(Color.fromRGBO(23, 25, 45, 1)),
  lightBlue(Color.fromRGBO(33, 136, 255, 1)),
  white(Color.fromRGBO(255, 255, 255, 1)),
  gray(Color.fromRGBO(142, 152, 163, 1)),
  whiteBorder(Color.fromRGBO(216, 223, 230, 1)),
  bodyText(Color.fromRGBO(119, 129, 140, 1)),
  neutralGray(Color.fromRGBO(234, 239, 243, 1)),
  ;

  final Color cor;
  const AppColorsEnum(this.cor);
}
