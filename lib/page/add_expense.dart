import 'package:budget_mate/views/add_expense/add_expense_desktop.dart';
import 'package:budget_mate/views/add_expense/add_expense_mobile.dart';
import 'package:flutter/material.dart';

class AddExpensePage extends StatelessWidget {
  const AddExpensePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return AddExpenseMobile();
        } else if (constraints.maxWidth <= 1200) {
          return AddExpenseDesktop();
        } else {
          return AddExpenseDesktop();
        }
      },
    );
  }
}
