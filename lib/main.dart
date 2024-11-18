import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shaxsiy_hamyyon/widgets/body.dart';
import './models/expense.dart';

import './widgets/header.dart';
import 'package:flutter_month_picker/flutter_month_picker.dart';
// ignore: duplicate_import
import './widgets/body.dart';
import './widgets/add_expense.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: MyWallet(),
    );
  }
}

class MyWallet extends StatefulWidget {
  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  Expenses expenseData = Expenses();
  DateTime selectedDate = DateTime.now();

  void showCalendar(BuildContext context) {
    showMonthPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2100),
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

  void nextDay() {
    if (selectedDate.year == DateTime.now().year &&
        selectedDate.month == DateTime.now().month) {
      return;
    }
    setState(
      () {
        selectedDate = DateTime(
          selectedDate.year,
          selectedDate.month + 1,
        );
      },
    );
  }

  void lastDay() {
    if (selectedDate.year == 2022 && selectedDate.month == 1) {
      return;
    }
    setState(() {
      selectedDate = DateTime(
        selectedDate.year,
        selectedDate.month - 1,
      );
    });
  }

  void showAddExpenseWindow(BuildContext context) {
    showModalBottomSheet(
      isDismissible: false,
      context: context,
      builder: (ctx) {
        return addExpense(addNewExpense);
      },
    );
  }

  void addNewExpense(String title, double amount, DateTime date) {
    setState(() {
      expenseData.addNewExpense(title, amount, date);
    });
  }

  void deleteExpense(String id) {
    setState(() {
      expenseData.delete(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final totalByMonth = expenseData.totalExpenseByMonth(selectedDate);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("My Wallet"),
      ),
      body: Column(
        children: [
          Header(
            totalByMonth,
            showCalendar,
            selectedDate,
            nextDay,
            lastDay,
          ),
          Body(totalByMonth, expenseData.itemsByMonth(selectedDate),
              deleteExpense),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        onPressed: () {
          showAddExpenseWindow(context);
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
