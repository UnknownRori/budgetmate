import 'package:budget_mate/components/transaction_item.dart';
import 'package:budget_mate/models/transaction.dart';
import 'package:budget_mate/utils/greetings.dart';
import 'package:budget_mate/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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
            return HomeMobile();
          } else {
            return HomeMobile();
          }
        },
      ),
    );
  }
}

class HomeMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final transactionRepo = Provider.of<TransactionRepository>(context);
    final NumberFormat formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ');
    final String totalBalanceFormatted =
        formatter.format(transactionRepo.totalBalance);
    final String totalIncomeFormatted =
        formatter.format(transactionRepo.totalIncome);
    final String totalExpenseFormatted =
        formatter.format(transactionRepo.totalExpense);

    return SafeArea(
      child: Container(
        padding: mobile.pagePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${getGreetingMessage()},", style: mobile.textSmallInfo),
            Text("UnknownRori", style: mobile.textBold),
            const SizedBox(height: 26),
            Card(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8, bottom: 8, left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Balance", style: mobile.text),
                        IconButton(
                          onPressed: () =>
                              ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Not implemented yet!"),
                              duration: Duration(seconds: 1),
                            ),
                          ),
                          icon: const Icon(Icons.more_vert),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      totalBalanceFormatted,
                      style: mobile.textBigBold,
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Row(
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  child: Icon(Icons.arrow_downward),
                                ),
                                SizedBox(width: 8),
                                Text("Income"),
                              ],
                            ),
                            Text(
                              totalIncomeFormatted,
                              style: mobile.text,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Row(
                              children: [
                                CircleAvatar(
                                  radius: 16,
                                  child: Icon(Icons.arrow_upward),
                                ),
                                SizedBox(width: 8),
                                Text("Expense"),
                              ],
                            ),
                            Text(
                              totalExpenseFormatted,
                              style: mobile.textDanger,
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Recent Transaction",
                  style: mobile.textMidBold,
                ),
                IconButton(
                  onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Not implemented yet!"),
                      duration: Duration(seconds: 1),
                    ),
                  ),
                  icon: const Icon(Icons.more_vert),
                ),
              ],
            ),
            Expanded(
              child: TransactionItemList(
                data: transactionRepo.latestTransactions(8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
