import 'package:budget_mate/components/back_button.dart';
import 'package:budget_mate/components/text_field.dart';
import 'package:budget_mate/models/transaction.dart';
import 'package:budget_mate/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

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

class AddExpenseDesktop extends StatefulWidget {
  @override
  _AddExpenseDesktopState createState() => _AddExpenseDesktopState();
}

class _AddExpenseDesktopState extends State<AddExpenseDesktop> {
  String categoryData = categoryIcons.keys.first;
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SafeArea(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: CustomBackButton(label: "Add Expense"),
              ),
            ),
            Center(
              child: SizedBox(
                width: 400,
                child: Card(
                  elevation: 4,
                  child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Category",
                            style: mobile.text,
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: DropdownButtonFormField<String>(
                              value: categoryData,
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.all(16),
                                border: OutlineInputBorder(),
                              ),
                              onChanged: (String? newValue) {
                                setState(() {
                                  categoryData = newValue!;
                                });
                              },
                              items: categoryIcons.entries.map((entry) {
                                return DropdownMenuItem<String>(
                                  value: entry.key,
                                  child: Row(
                                    children: [
                                      Icon(entry.value.icon),
                                      const SizedBox(width: 8),
                                      Text(entry.key),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Amount",
                            style: mobile.text,
                          ),
                          BorderTextField(
                            controller: _amountController,
                            inputType: TextInputType.number,
                            formatter: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Date",
                            style: mobile.text,
                          ),
                          BorderTextField(
                            controller: _dateController,
                            inputType: TextInputType.datetime,
                            inputDecoration: const InputDecoration(
                              suffixIcon: Icon(Icons.calendar_month),
                            ),
                            readOnly: true,
                            onTap: () {
                              _selectDate(context);
                            },
                          ),
                          const SizedBox(height: 26),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                flex: 2,
                                child: FilledButton(
                                  onPressed: () {
                                    if (_amountController.text == "" ||
                                        categoryData == "" ||
                                        _dateController.text == "") {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor:
                                                  Colors.red.withOpacity(0.8),
                                              content: Text(
                                                  "Please fill out the form",
                                                  style: mobile.text),
                                              duration:
                                                  const Duration(seconds: 1)));
                                    }

                                    final isSuccess = context
                                        .read<TransactionRepository>()
                                        .addTransaction(Transaction(
                                            type: TransactionType.expense,
                                            amount: double.parse(
                                                _amountController.text),
                                            date: DateTime.parse(
                                                _dateController.text),
                                            category: categoryData));

                                    if (isSuccess) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(
                                              backgroundColor:
                                                  Colors.green.withOpacity(0.8),
                                              content: Text("Success",
                                                  style: mobile.text),
                                              duration:
                                                  const Duration(seconds: 1)));
                                    }
                                  },
                                  child: Text(
                                    "Save",
                                    style: mobile.text,
                                  ),
                                ),
                              ),
                              const Spacer(flex: 1),
                              Expanded(
                                flex: 2,
                                child: OutlinedButton(
                                  onPressed: () {
                                    _dateController.clear();
                                    _amountController.text = "";
                                    // categoryData = "";
                                  },
                                  child: Text(
                                    "Clear",
                                    style: mobile.text,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      // Format the date and set it to the TextField
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {
        _dateController.text = formattedDate;
      });
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }
}

class AddExpenseMobile extends StatefulWidget {
  @override
  _AddExpenseMobileState createState() => _AddExpenseMobileState();
}

class _AddExpenseMobileState extends State<AddExpenseMobile> {
  String categoryData = categoryIcons.keys.first;
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: CustomBackButton(label: "Add Expense"),
            ),
          ),
          Padding(
            padding: mobile.pagePadding,
            child: Card(
              elevation: 4,
              child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Category",
                        style: mobile.text,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DropdownButtonFormField<String>(
                          value: categoryData,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.all(16),
                            border: OutlineInputBorder(),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              categoryData = newValue!;
                            });
                          },
                          items: categoryIcons.entries.map((entry) {
                            return DropdownMenuItem<String>(
                              value: entry.key,
                              child: Row(
                                children: [
                                  Icon(entry.value.icon),
                                  const SizedBox(width: 8),
                                  Text(entry.key),
                                ],
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Amount",
                        style: mobile.text,
                      ),
                      BorderTextField(
                        controller: _amountController,
                        inputType: TextInputType.number,
                        formatter: [
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Date",
                        style: mobile.text,
                      ),
                      BorderTextField(
                        controller: _dateController,
                        inputType: TextInputType.datetime,
                        inputDecoration: const InputDecoration(
                          suffixIcon: Icon(Icons.calendar_month),
                        ),
                        readOnly: true,
                        onTap: () {
                          _selectDate(context);
                        },
                      ),
                      const SizedBox(height: 26),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            flex: 2,
                            child: FilledButton(
                              onPressed: () {
                                if (_amountController.text == "" ||
                                    categoryData == "" ||
                                    _dateController.text == "") {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor:
                                              Colors.red.withOpacity(0.8),
                                          content: Text(
                                              "Please fill out the form",
                                              style: mobile.text),
                                          duration:
                                              const Duration(seconds: 1)));
                                }

                                final isSuccess = context
                                    .read<TransactionRepository>()
                                    .addTransaction(Transaction(
                                        type: TransactionType.expense,
                                        amount: double.parse(
                                            _amountController.text),
                                        date: DateTime.parse(
                                            _dateController.text),
                                        category: categoryData));

                                if (isSuccess) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          backgroundColor:
                                              Colors.green.withOpacity(0.8),
                                          content: Text("Success",
                                              style: mobile.text),
                                          duration:
                                              const Duration(seconds: 1)));
                                }
                              },
                              child: Text(
                                "Save",
                                style: mobile.text,
                              ),
                            ),
                          ),
                          const Spacer(flex: 1),
                          Expanded(
                            flex: 2,
                            child: OutlinedButton(
                              onPressed: () {
                                _dateController.clear();
                                _amountController.text = "";
                                // categoryData = "";
                              },
                              child: Text(
                                "Clear",
                                style: mobile.text,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    print(picked);
    if (picked != null) {
      // Format the date and set it to the TextField
      String formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      setState(() {
        _dateController.text = formattedDate;
      });
    }
  }

  @override
  void dispose() {
    _amountController.dispose();
    _dateController.dispose();
    super.dispose();
  }
}
