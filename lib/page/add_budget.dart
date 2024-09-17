import 'package:budget_mate/components/back_button.dart';
import 'package:budget_mate/components/text_field.dart';
import 'package:budget_mate/models/transaction.dart';
import 'package:budget_mate/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddBudgetPage extends StatelessWidget {
  const AddBudgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth <= 600) {
          return AddBudgetMobile();
        } else if (constraints.maxWidth <= 1200) {
          return AddBudgetMobile();
        } else {
          return AddBudgetMobile();
        }
      },
    );
  }
}

class AddBudgetMobile extends StatefulWidget {
  @override
  _AddBudgetMobileState createState() => _AddBudgetMobileState();
}

class _AddBudgetMobileState extends State<AddBudgetMobile> {
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
              child: CustomBackButton(label: "Add Income"),
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
                      DropdownMenu(
                        width: double.infinity,
                        initialSelection: categoryData,
                        onSelected: (String? val) => setState(() {
                          categoryData = val!;
                        }),
                        dropdownMenuEntries: categoryIcons.entries.map((entry) {
                          return DropdownMenuEntry<String>(
                            value: entry.key, // The category name as the value
                            label: entry.key,
                            leadingIcon: Icon(entry.value),
                          );
                        }).toList(),
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
                                        type: TransactionType.income,
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
