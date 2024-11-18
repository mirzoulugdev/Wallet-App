import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class addExpense extends StatefulWidget {
  final Function addNewExpense;
  addExpense(this.addNewExpense);
  @override
  State<addExpense> createState() => _addExpenseState();
}

class _addExpenseState extends State<addExpense> {
  DateTime? selectedDate;
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  void showNewExpenceCalendar(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2025),
    ).then(
      (value) {
        if (value != null) {
          setState(() {
            selectedDate = value;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: "Harajat nomi",
            ),
            controller: _titleController,
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Harajat miqdori",
            ),
            keyboardType: TextInputType.number,
            controller: _amountController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              selectedDate == null
                  ? Text(
                      "Harajat kuni tanlanmadi",
                    )
                  : Text("Harajat kuni: ${DateFormat("dd MMMM, yyyy").format(
                      selectedDate!,
                    )}"),
              TextButton(
                onPressed: () {
                  showNewExpenceCalendar(context);
                },
                child: Text(
                  "Kunni tanlash",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                  ),
                ),
              )
            ],
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
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 17,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  print(_titleController.text);
                  print(_amountController.text);
                  if (_titleController.text.isEmpty ||
                      _amountController.text.isEmpty ||
                      selectedDate == null) {
                    return;
                  }

                  var title = _titleController.text;
                  var amount = double.parse(_amountController.text);

                  if (amount <= 0) {
                    return;
                  }
                  widget.addNewExpense(title, amount, selectedDate);
                  Navigator.of(context).pop();
                },
                child: Text(
                  "Kiritish",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.red)),
              ),
            ],
          )
        ],
      ),
    );
  }
}
