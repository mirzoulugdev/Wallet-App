import 'package:flutter/material.dart';

class EditMonthlyBudget extends StatefulWidget {
  final Function changeBudgetLimit;
  final double budgetLimit;

  EditMonthlyBudget(this.changeBudgetLimit, this.budgetLimit);
  @override
  State<EditMonthlyBudget> createState() => _EditMonthlyBudgetState();
}

class _EditMonthlyBudgetState extends State<EditMonthlyBudget> {
  late TextEditingController _budgetAmountController;
  @override
  void initState() {
    _budgetAmountController = TextEditingController();
    _budgetAmountController.text = widget.budgetLimit.toStringAsFixed(0);
    super.initState();
  }

  @override
  void dispose() {
    print("MOdal oyna yopildi");
    _budgetAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Oylik byudjet miqdori",
            ),
            keyboardType: TextInputType.number,
            controller: _budgetAmountController,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Bekor Qilish",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_budgetAmountController.text.isEmpty) {
                    return;
                  }

                  final amount = double.parse(_budgetAmountController.text);
                  if (amount > 0) {
                    widget.changeBudgetLimit(amount);
                  }

                  Navigator.of(context).pop();
                },
                child: Text(
                  "O'zgartirish",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
