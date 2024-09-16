import 'package:budget_mate/page/add_budget.dart';
import 'package:budget_mate/page/goals_page.dart';
import 'package:budget_mate/page/home_page.dart';
import 'package:budget_mate/page/profile_page.dart';
import 'package:budget_mate/page/statistics_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    StatisticsPage(),
    GoalsPage(),
    ProfilePage(),
    AddBudgetPage(),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Mate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: _pages[_currentIndex],
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _changePage(4);
          },
          backgroundColor: Colors.white,
          elevation: 6.0,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 16.0,
          child: Container(
              margin: const EdgeInsets.only(top: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () => _changePage(0),
                      icon: const Icon(Icons.home)),
                  IconButton(
                      onPressed: () => _changePage(1),
                      icon: const Icon(Icons.bar_chart)),
                  IconButton(
                      onPressed: () => _changePage(2),
                      icon: const Icon(Icons.track_changes)),
                  IconButton(
                      onPressed: () => _changePage(3),
                      icon: const Icon(Icons.person)),
                ],
              )),
        ),
      ),
    );
  }

  void _changePage(val) {
    setState(() {
      _currentIndex = val;
    });
  }
}
