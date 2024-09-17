import 'package:budget_mate/models/transaction.dart';
import 'package:budget_mate/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

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
            return StatisticsMobile();
          } else {
            return StatisticsMobile();
          }
        },
      ),
    );
  }
}

class StatisticsMobile extends StatefulWidget {
  @override
  _StatisticsMobileState createState() => _StatisticsMobileState();
}

class _StatisticsMobileState extends State<StatisticsMobile> {
  @override
  Widget build(BuildContext context) {
    final transactionRepo = Provider.of<TransactionRepository>(context);
    final NumberFormat formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ');
    final topSpendings = transactionRepo.sumExpenseByCategory();

    return SafeArea(
      child: Padding(
        padding: mobile.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Top Spending", style: mobile.textMidBold),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.sort),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: topSpendings.length,
                  itemBuilder: (context, index) {
                    final item = topSpendings[index];

                    final String itemAmount = formatter.format(item.amount);
                    return Card(
                      elevation: 4,
                      child: InkWell(
                        onTap: () => ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Not implemented yet!"),
                            duration: Duration(seconds: 1),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Icon(item.getCategoryIcon()),
                              ),
                              Expanded(
                                flex: 2,
                                child: Text(item.category),
                              ),
                              Expanded(
                                flex: 3,
                                child: item.type == TransactionType.income
                                    ? Text(itemAmount, style: mobile.text)
                                    : Text(itemAmount,
                                        style: mobile.textDanger),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
