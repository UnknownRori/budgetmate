import 'package:budget_mate/utils/theme.dart';
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
            return GoalsMobile();
          } else {
            return GoalsMobile();
          }
        },
      ),
    );
  }
}

class GoalsMobile extends StatefulWidget {
  @override
  _GoalsMobileState createState() => _GoalsMobileState();
}

class _GoalsMobileState extends State<GoalsMobile> {
  bool receiveAlerts = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: mobile.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Monthly Budget", style: mobile.textBold),
                        Text("Rp. 1.500.000,00", style: mobile.textBold),
                      ],
                    ),
                    const SizedBox(height: 32),
                    LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(12.5),
                      value: 0.7,
                      color: Colors.blue,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Left", style: mobile.text),
                        Text("Rp. 950.000", style: mobile.text),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.more_horiz),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Text("Receive Alerts", style: mobile.textBold),
                const SizedBox(width: 16),
                Switch(
                    value: receiveAlerts,
                    onChanged: (val) {
                      setState(() {
                        receiveAlerts = val;
                      });
                    }),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
