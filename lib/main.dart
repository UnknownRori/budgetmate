import 'package:budget_mate/models/transaction.dart';
import 'package:budget_mate/page/add_budget.dart';
import 'package:budget_mate/page/add_expense.dart';
import 'package:budget_mate/page/goals_page.dart';
import 'package:budget_mate/page/home_page.dart';
import 'package:budget_mate/page/profile_page.dart';
import 'package:budget_mate/page/statistics_page.dart';
import 'package:budget_mate/utils/page_animation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TransactionRepository()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Budget Mate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: const Color(0xedededff),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  bool _isButtonExpanded = false;
  PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _pages = [
    const HomePage(),
    const StatisticsPage(),
    const GoalsPage(),
    const ProfilePage(),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) => _changePage(index),
            children: _pages,
          ),
          Positioned(
            bottom: 35,
            left: MediaQuery.of(context).size.width / 2.0 - 44 * 2,
            child: AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: _isButtonExpanded ? 1.0 : 0.0,
              child: Center(
                child: Row(
                  children: [
                    ElevatedButton(
                      onLongPress: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Add Income"),
                          duration: Duration(seconds: 1),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _isButtonExpanded = false;
                        });
                        changePageAnimation(context, AddBudgetPage());
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.attach_money, size: 32),
                        ],
                      ),
                    ),
                    const SizedBox(width: 26),
                    ElevatedButton(
                      onLongPress: () =>
                          ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Add Expense"),
                          duration: Duration(seconds: 1),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          _isButtonExpanded = false;
                        });
                        changePageAnimation(context, AddExpensePage());
                      },
                      child: const Row(
                        children: [
                          Icon(Icons.payments, size: 32),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Builder(
        builder: (BuildContext context) {
          return FloatingActionButton(
            onPressed: () {
              setState(() {
                _isButtonExpanded = !_isButtonExpanded;
              });
            },
            backgroundColor: Colors.white,
            elevation: 6.0,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              key: ValueKey<bool>(_isButtonExpanded),
              child: _isButtonExpanded
                  ? const Icon(Icons.close)
                  : const Icon(Icons.description),
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        padding: const EdgeInsets.all(0.0),
        clipBehavior: Clip.antiAlias,
        elevation: 4,
        notchMargin: 16.0,
        child: SafeArea(
          child: BottomNavigationBar(
            onTap: (index) {
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease);
            },
            type: BottomNavigationBarType.fixed,
            currentIndex: _currentIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'Statistic',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.track_changes),
                label: 'Goals',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
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
