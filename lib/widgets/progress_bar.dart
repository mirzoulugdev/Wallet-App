import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double totalLimitPercentage;

  ProgressBar(this.totalLimitPercentage);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: double.infinity,
      height: 5,
      decoration: BoxDecoration(
        color: Color.fromRGBO(212, 219, 239, 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: FractionallySizedBox(
        heightFactor: 2,
        widthFactor: totalLimitPercentage / 100,
        child: Container(
          width: 50,
          height: 10,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.red,
                Colors.red,
                Colors.red.shade200,
                Colors.red,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.red,
                blurRadius: 10,
                spreadRadius: -2,
              )
            ],
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ),
    );
  }
}
