import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  final Function showCalendar;
  final DateTime selectedDate;
  final Function nextDay;
  final Function lastDay;
  final double totalByMonth;
  Header(
    this.totalByMonth,
    this.showCalendar,
    this.selectedDate,
    this.nextDay,
    this.lastDay,
  );

  @override
  Widget build(BuildContext context) {
    final isLastDate = selectedDate.year == DateTime.now() &&
        selectedDate.month == DateTime.now();
    final isFirstDate = selectedDate.year == DateTime.now().year &&
        selectedDate.month == DateTime.now().month;
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextButton(
            onPressed: () {
              showCalendar(context);
            },
            child: Text(
              DateFormat("MMMM, y").format(selectedDate),
              style: TextStyle(
                fontSize: 25,
                color: Colors.red,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 40,
                height: 40,
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    lastDay();
                  },
                  icon: Icon(
                    Icons.arrow_left,
                    size: 30,
                    color: isLastDate ? Colors.grey : Colors.red,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: isLastDate ? Colors.grey : Colors.red),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    totalByMonth.toStringAsFixed(0),
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "So'm",
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      height: 0.2,
                      fontSize: 15,
                    ),
                  )
                ],
              ),
              Container(
                width: 40,
                height: 40,
                child: IconButton(
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    nextDay();
                  },
                  icon: Icon(
                    Icons.arrow_right,
                    size: 30,
                    color: isFirstDate ? Colors.grey : Colors.red,
                  ),
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: isFirstDate ? Colors.grey : Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
              )
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
