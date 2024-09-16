import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum TransactionType {
  income,
  expense,
}

Map<String, IconData> categoryIcons = {
  'Salary': Icons.attach_money,
  'Shopping': Icons.shopping_cart,
  'Electricity': Icons.electrical_services,
  'Transport': Icons.directions_bus,
  'Entertainment': Icons.movie,
  'Rent': Icons.home,
};

class Transaction {
  String id;
  TransactionType type;
  double amount;
  DateTime date;
  String category;

  Transaction({
    String? id,
    required this.type,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = id ?? const Uuid().v4();

  // Get the icon for the category
  // Default to 'help' if no icon is found

  IconData getCategoryIcon() {
    return categoryIcons[category] ?? Icons.help;
  }
}

class TransactionRepository {
  // Default dummy data
  List<Transaction> _data = [
    Transaction(
        type: TransactionType.income,
        date: DateTime.now(),
        amount: 3000000,
        category: "Salary"),
    Transaction(
        type: TransactionType.expense,
        date: DateTime.now(),
        amount: 250000,
        category: "Shopping"),
    Transaction(
        type: TransactionType.expense,
        date: DateTime.now(),
        amount: 100000,
        category: "Electricity"),
    Transaction(
        type: TransactionType.expense,
        date: DateTime.now(),
        amount: 150000,
        category: "Rent"),
    Transaction(
        type: TransactionType.expense,
        date: DateTime.now(),
        amount: 100000,
        category: "Transport"),
    Transaction(
        type: TransactionType.expense,
        date: DateTime.now(),
        amount: 150000,
        category: "Entertainment"),
  ];

  void addTransaction(Transaction transaction) {
    _data.add(transaction);
  }

  List<Transaction> getAll() {
    return List.unmodifiable(_data);
  }

  bool removeTransactionById(String id) {
    final transactionIndex =
        _data.indexWhere((transaction) => transaction.id == id);

    if (transactionIndex != -1) {
      _data.removeAt(transactionIndex);
      return true;
    }

    return false;
  }

  double get totalBalance {
    return _data.fold(0, (total, transaction) {
      switch (transaction.type) {
        case TransactionType.income:
          return total + transaction.amount;
        case TransactionType.expense:
          return total - transaction.amount;
      }
    });
  }

  double get totalIncome {
    return _data.fold(0, (total, transaction) {
      switch (transaction.type) {
        case TransactionType.income:
          return total + transaction.amount;
        case TransactionType.expense:
          return total;
      }
    });
  }

  double get totalExpense {
    return _data.fold(0, (total, transaction) {
      switch (transaction.type) {
        case TransactionType.income:
          return total;
        case TransactionType.expense:
          return total + transaction.amount;
      }
    });
  }
}
