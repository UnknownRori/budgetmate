import 'package:budget_mate/views/home/home_desktop.dart';
import 'package:budget_mate/views/home/home_mobile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return HomeMobile();
          } else if (constraints.maxWidth <= 1200) {
            return HomeDesktop();
          } else {
            return HomeDesktop();
          }
        },
      ),
    );
  }
}
