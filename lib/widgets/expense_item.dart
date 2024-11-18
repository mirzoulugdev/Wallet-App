import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseItem extends StatelessWidget {
  final String id;
  final String title;
  final DateTime date;
  final double amount;
  final Key key;
  final Function deleteExpense;

  ExpenseItem(
    this.title,
    this.amount,
    this.date,
    this.id,
    this.key,
    this.deleteExpense,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (direction) {
        deleteExpense(id);
      },
      direction: DismissDirection.endToStart,
      background: Container(
        padding: const EdgeInsets.only(
          right: 15,
        ),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      key: key,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.red,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          DateFormat("dd-MMMM, y").format(date),
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        trailing: Text("${amount} so'm"),
      ),
    );
  }
}
