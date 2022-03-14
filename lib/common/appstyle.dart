import 'package:continental_poc/common/fontfamily.dart';
import 'package:flutter/material.dart';

class Styles {
  static const TextStyle headerStyles = TextStyle(
    fontFamily: FontFamily.robotoMono,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  );

  static const TextStyle buttonStyles = TextStyle(
    fontFamily: FontFamily.robotoMono,
    fontWeight: FontWeight.normal,
    fontSize: 16,
    color: Colors.white,
  );

  static ButtonStyle style = ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.white),
      padding:
          MaterialStateProperty.all(const EdgeInsets.fromLTRB(20, 0, 20, 0)),
      textStyle: MaterialStateProperty.all(const TextStyle(fontSize: 25)));
}
