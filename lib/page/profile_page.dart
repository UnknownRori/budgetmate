import 'package:budget_mate/views/profile/profile_desktop.dart';
import 'package:budget_mate/views/profile/profile_mobile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return const ProfileMobile();
          } else if (constraints.maxWidth <= 1200) {
            return const ProfileDesktop();
          } else {
            return const ProfileDesktop();
          }
        },
      ),
    );
  }
}
