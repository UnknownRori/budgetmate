import 'package:budget_mate/models/transaction.dart';
import 'package:budget_mate/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GoalsItemList extends StatelessWidget {
  List<Category> data;

  GoalsItemList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final NumberFormat formatter =
        NumberFormat.currency(locale: 'id_ID', symbol: 'Rp. ');

    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          final item = data[index];

          final String itemAmount = formatter.format(item.goalAmount);
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
                      child: Icon(item.icon),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(item.name),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(itemAmount),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
