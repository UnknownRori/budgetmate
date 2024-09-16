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
          padding: EdgeInsets.all(0.0),
          clipBehavior: Clip.antiAlias,
          elevation: 4,
          notchMargin: 16.0,
          child: SafeArea(
            child: BottomNavigationBar(
              onTap: (index) {
                setState(() {
                  _changePage(index);
                });
              },
              type: BottomNavigationBarType.fixed,
              currentIndex: _currentIndex,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.track_changes),
                  label: '',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: '',
                ),
              ],
            ),
          ),
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
