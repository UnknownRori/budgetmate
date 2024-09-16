import 'package:flutter/material.dart';

class Theme {
  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle text;
  final TextStyle textDanger;

  const Theme({
    required this.title,
    required this.subtitle,
    required this.text,
    required this.textDanger,
  });
}

const Theme mobile = Theme(
  title: TextStyle(
      fontSize: 42, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
  subtitle: TextStyle(
      fontSize: 32, fontWeight: FontWeight.bold, fontFamily: 'poppins'),
  text: TextStyle(fontSize: 16, fontFamily: 'poppins'),
  textDanger: TextStyle(fontSize: 16, color: Colors.red, fontFamily: 'poppins'),
);
