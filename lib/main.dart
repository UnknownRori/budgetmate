import 'package:budget_mate/app.dart';
import 'package:budget_mate/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => TransactionRepository()),
    ],
    child: MyApp(),
  ));
}
