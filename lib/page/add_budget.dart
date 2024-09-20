import 'package:budget_mate/views/add_income/add_income_desktop.dart';
import 'package:budget_mate/views/add_income/add_income_mobile.dart';
import 'package:flutter/material.dart';

class AddBudgetPage extends StatelessWidget {
  const AddBudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return AddBudgetMobile();
        } else if (constraints.maxWidth <= 1200) {
          return AddBudgetDesktop();
        } else {
          return AddBudgetDesktop();
        }
      },
    );
  }
}
