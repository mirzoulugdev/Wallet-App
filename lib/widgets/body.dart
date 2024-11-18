import 'package:flutter/material.dart';
import 'package:shaxsiy_hamyyon/widgets/expense_list2.dart';

import './budget.dart';
import './expense_list.dart';
import '../models/expense.dart';

class Body extends StatelessWidget {
  final List<Expense> expenses;
  final double totalByMonth;
  final Function deleteExpense;

  Body(
    this.totalByMonth,
    this.expenses,
    this.deleteExpense,
  );
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Budget(totalByMonth),
        ExpenseList(
          expenses,
          deleteExpense,
        ),
      ],
    );
  }
}
