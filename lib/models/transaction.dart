import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

enum TransactionType {
  income,
  expense,
}

Map<String, Category> categoryIcons = {
  'Salary': Category(goalAmount: 0, icon: Icons.attach_money),
  'Shopping': Category(goalAmount: 900000, icon: Icons.shopping_cart),
  'Electricity': Category(goalAmount: 200000, icon: Icons.electrical_services),
  'Transport': Category(goalAmount: 150000, icon: Icons.directions_bus),
  'Entertainment': Category(goalAmount: 250000, icon: Icons.movie),
  'Rent': Category(goalAmount: 150000, icon: Icons.home),
};

class Category {
  double goalAmount;
  IconData icon;

  Category({required this.goalAmount, required this.icon});
}

class SumTransaction {
  TransactionType type;
  double amount;
  String category;

  SumTransaction({
    required this.type,
    required this.amount,
    required this.category,
  });

  IconData getCategoryIcon() {
    return categoryIcons[category]!.icon ?? Icons.help;
  }
}

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
    return categoryIcons[category]!.icon ?? Icons.help;
  }
}

class TransactionRepository with ChangeNotifier {
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
        amount: 350000,
        category: "Entertainment"),
  ];

  bool addTransaction(Transaction transaction) {
    notifyListeners();
    _data.add(transaction);
    return true;
  }

  List<Transaction> getAll() {
    return List.unmodifiable(_data);
  }

  bool removeTransactionById(String id) {
    final transactionIndex =
        _data.indexWhere((transaction) => transaction.id == id);

    if (transactionIndex != -1) {
      _data.removeAt(transactionIndex);
      notifyListeners();
      return true;
    }

    return false;
  }

  List<SumTransaction> sumExpenseByCategory() {
    Map<String, SumTransaction> categorySums = {};

    for (var transaction in _data) {
      if (categorySums.containsKey(transaction.category)) {
        if (transaction.type == TransactionType.expense) {
          categorySums[transaction.category]!.amount += transaction.amount;
        }
      } else {
        if (transaction.type == TransactionType.expense) {
          categorySums[transaction.category] = SumTransaction(
              type: transaction.type,
              amount: transaction.amount,
              category: transaction.category);
        }
      }
    }

    return categorySums.values.toList();
  }

  List<Transaction> latestTransactions(int total) {
    List<Transaction> sortedTransactions = List.from(_data);
    sortedTransactions.sort((a, b) => b.date.compareTo(a.date));

    return sortedTransactions.take(total).toList();
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
