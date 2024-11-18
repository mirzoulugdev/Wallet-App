import 'package:flutter/material.dart';

import '../models/expense.dart';
// ignore: duplicate_import
import './expense_item.dart';

class ExpenseList extends StatelessWidget {
  final List<Expense> expenses;
  final Function deleteExpense;

  const ExpenseList(
    this.expenses,
    this.deleteExpense,
  );
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        clipBehavior: Clip.hardEdge,
        width: MediaQuery.of(context).size.width,
        height: 470,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(
              50,
            ),
          ),
        ),
        child: expenses.length > 0
            ? ListView.builder(
                padding: const EdgeInsets.only(
                  top: 15,
                  right: 10,
                ),
                itemBuilder: (ctx, i) {
                  return ExpenseItem(
                    expenses[i].title,
                    expenses[i].amount,
                    expenses[i].date,
                    deleteExpense as String,
                    ValueKey(),
                    expenses[i].id,
                  );
                },
                itemCount: expenses.length,
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const Text(
                      "Xarajat mavjud emas!",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.asset(
                      "assets/images/ufo.png",
                      fit: BoxFit.cover,
                      width: 250,
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
