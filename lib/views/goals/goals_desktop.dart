import 'package:budget_mate/components/goals_item.dart';
import 'package:budget_mate/models/transaction.dart';
import 'package:budget_mate/utils/theme.dart';
import 'package:flutter/material.dart';

class GoalsDesktop extends StatefulWidget {
  @override
  _GoalsDesktopState createState() => _GoalsDesktopState();
}

class _GoalsDesktopState extends State<GoalsDesktop> {
  bool receiveAlerts = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
      child: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 2,
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Monthly Budget", style: mobile.textBold),
                                Text("Rp. 1.500.000,00",
                                    style: mobile.textBold),
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
                              children: [
                                Text("Left", style: mobile.text),
                                const SizedBox(width: 24),
                                Text("Rp. 950.000", style: mobile.text),
                                IconButton(
                                  onPressed: () => ScaffoldMessenger.of(context)
                                      .showSnackBar(
                                    const SnackBar(
                                      content: Text("Not implemented yet!"),
                                      duration: Duration(seconds: 1),
                                    ),
                                  ),
                                  icon: const Icon(Icons.more_horiz),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Budget Category", style: mobile.textBold),
                            IconButton(
                                onPressed: () =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Not implemented yet!"),
                                        duration: Duration(seconds: 1),
                                      ),
                                    ),
                                icon: const Icon(Icons.add)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: GoalsItemList(
                              data: categoryIcons.values
                                  .where((n) => n.goalAmount > 0)
                                  .toList()),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _refresh() async {}
}
