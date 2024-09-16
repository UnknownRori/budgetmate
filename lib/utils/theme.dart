import 'package:flutter/material.dart';

class Theme {
  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle text;
  final TextStyle textBold;
  final TextStyle textDanger;

  final TextStyle textBig;

  final TextStyle textSmallInfo;

  final EdgeInsets pagePadding;

  const Theme({
    required this.title,
    required this.subtitle,
    required this.text,
    required this.textBold,
    required this.textDanger,
    required this.textBig,
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
  textBig: TextStyle(
      fontSize: 24, fontFamily: 'poppins', fontWeight: FontWeight.bold),
  textSmallInfo:
      TextStyle(fontSize: 14, fontFamily: 'poppins', color: Colors.grey),
  textDanger: TextStyle(fontSize: 16, color: Colors.red, fontFamily: 'poppins'),
  pagePadding: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 24),
);
