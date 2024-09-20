import 'package:budget_mate/views/goals/goals_desktop.dart';
import 'package:budget_mate/views/goals/goals_mobile.dart';
import 'package:flutter/material.dart';

class GoalsPage extends StatelessWidget {
  const GoalsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Goals',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return GoalsMobile();
          } else if (constraints.maxWidth <= 1200) {
            return GoalsDesktop();
          } else {
            return GoalsDesktop();
          }
        },
      ),
    );
  }
}
