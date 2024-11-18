import 'package:flutter/material.dart';

class Expense {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final IconData icon;

  Expense({
    required this.id,
    required this.title,
    required this.date,
    required this.amount,
    this.icon = Icons.ac_unit,
  });
}

class Expenses {
  List<Expense> _items = [
    Expense(
        id: "e1",
        title: "Noutbuk sotib olish",
        date: DateTime.now(),
        amount: 600000),
    Expense(
        id: "e2",
        title: "Kommunal to'lovlar",
        date: DateTime.now(),
        amount: 45000),
    Expense(
      id: "e3",
      title: "Kurs to'lovi",
      date: DateTime.now(),
      amount: 200000,
    ),
    Expense(
      id: "e4",
      title: "mashina to'lovi",
      date: DateTime.now(),
      amount: 5000,
    ),
  ];

  List<Expense> get items {
    return _items;
  }

  List<Expense> itemsByMonth(DateTime date) {
    return _items
        .where((expense) =>
            expense.date.month == date.month && expense.date.year == date.year)
        .toList();
  }

  double totalExpenseByMonth(DateTime date) {
    final expensesByMonth = itemsByMonth(date);

    return expensesByMonth.fold(0, (previousValue, expense) {
      return previousValue + expense.amount;
    });
  }

  void addNewExpense(String title, double amount, DateTime date) {
    _items.insert(
        0,
        Expense(
            id: "e${_items.length + 1}",
            title: title,
            date: date,
            amount: amount));
  }

  void delete(String id) {
    _items.removeWhere((expense) => expense.id == id);
  }
}
