import 'package:budget_mate/views/statistics/statistics_desktop.dart';
import 'package:budget_mate/views/statistics/statistics_mobile.dart';
import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Statistics',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth <= 600) {
            return StatisticsMobile();
          } else if (constraints.maxWidth <= 1200) {
            return StatisticsDesktop(gridCount: 4);
          } else {
            return StatisticsDesktop(gridCount: 6);
          }
        },
      ),
    );
  }
}
