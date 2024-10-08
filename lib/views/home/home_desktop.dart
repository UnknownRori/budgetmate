import 'package:budget_mate/components/transaction_item.dart';
import 'package:budget_mate/models/transaction.dart';
import 'package:budget_mate/utils/greetings.dart';
import 'package:budget_mate/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class HomeDesktop extends StatelessWidget {
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

    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.only(left: 24, right: 24),
      child: SingleChildScrollView(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),
              Text("${getGreetingMessage()},", style: mobile.textSmallInfo),
              Text("UnknownRori", style: mobile.textBold),
              const SizedBox(height: 26),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 2,
                    child: Card(
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
                                  onPressed: () => ScaffoldMessenger.of(context)
                                      .showSnackBar(
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
                            const SizedBox(height: 8),
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
                  ),
                  const SizedBox(width: 24),
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Recent Transaction",
                              style: mobile.textMidBold,
                            ),
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
                        SizedBox(
                          width: double.infinity,
                          height: 300,
                          child: TransactionItemList(
                            data: transactionRepo.latestTransactions(8),
                          ),
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
