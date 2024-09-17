import 'package:flutter/material.dart';

class AppColor {
  static const normal = Colors.black;
  static const secondary = Colors.grey;
  static const danger = Colors.red;
}

class Theme {
  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle text;
  final TextStyle textBold;
  final TextStyle textDanger;

  final TextStyle textMidBold;

  final TextStyle textBigBold;

  final TextStyle textSmallInfo;

  final EdgeInsets pagePadding;

  const Theme({
    required this.title,
    required this.subtitle,
    required this.text,
    required this.textBold,
    required this.textDanger,
    required this.textMidBold,
    required this.textBigBold,
    required this.textSmallInfo,
    required this.pagePadding,
  });
}

const Theme mobile = Theme(
  title: TextStyle(
      fontSize: 42, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
  subtitle: TextStyle(
      fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
  text: TextStyle(fontSize: 16, fontFamily: 'poppins'),
  textBold: TextStyle(
      fontSize: 16, fontFamily: 'poppins', fontWeight: FontWeight.bold),
  textMidBold: TextStyle(
      fontSize: 18, fontFamily: 'poppins', fontWeight: FontWeight.bold),
  textBigBold: TextStyle(
      fontSize: 24, fontFamily: 'poppins', fontWeight: FontWeight.bold),
  textSmallInfo:
      TextStyle(fontSize: 14, fontFamily: 'poppins', color: AppColor.secondary),
  textDanger:
      TextStyle(fontSize: 16, color: AppColor.danger, fontFamily: 'poppins'),
  pagePadding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
);
