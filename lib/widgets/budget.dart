import 'package:flutter/material.dart';
import 'package:shaxsiy_hamyyon/widgets/edit_monthly_budget.dart';
import 'package:shaxsiy_hamyyon/widgets/progress_bar.dart';
// ignore: duplicate_import
import './progress_bar.dart';

class Budget extends StatefulWidget {
  final double totalByMonth;

  Budget(this.totalByMonth);

  @override
  State<Budget> createState() => _BudgetState();
}

class _BudgetState extends State<Budget> {
  double budgetLimit = 1000000;

  void showMonthlyBudgetWindow(BuildContext context) {
    showModalBottomSheet(
        isDismissible: false,
        context: context,
        builder: (ctx) {
          return EditMonthlyBudget(
            changeBudgetLimit,
            budgetLimit,
          );
        });
  }

  void changeBudgetLimit(double amount) {
    setState(() {
      budgetLimit = amount;
    });
  }

  @override
  Widget build(BuildContext context) {
    var totalLimitPercentage = 100 * widget.totalByMonth / budgetLimit;
    totalLimitPercentage =
        totalLimitPercentage > 100 ? 100 : totalLimitPercentage;
    return Container(
      padding: const EdgeInsets.all(20),
      height: 573,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromRGBO(239, 240, 250, 1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    "Oylik byudjet: ",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      showMonthlyBudgetWindow(context);
                    },
                    icon: Icon(
                      Icons.edit,
                      size: 25,
                      color: Colors.red,
                    ),
                    label: Text(
                      "${budgetLimit.toStringAsFixed(0)}",
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                "${(totalLimitPercentage).toStringAsFixed(1)}% ",
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ],
          ),
          ProgressBar(totalLimitPercentage)
        ],
      ),
    );
  }
}
