import 'package:expenses/components/chart_bar.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  //
  final List<Transaction> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTransaction {
    return List.generate(7, (index) {
      //
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );

      double totalSum = this
          .recentTransaction
          .where((e) =>
              DateFormat.yMd().format(e.date) ==
              DateFormat.yMd().format(weekDay))
          .map((e) => e.value)
          .fold(0, (p, c) => p + c);

      return {
        'day': DateFormat.E().format(weekDay)[0],
        'value': totalSum,
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    groupedTransaction;
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransaction
            .map((e) => ChartBar(
                  label: e['day'],
                  sumDay: e['value'],
                  percent: 0.0,
                ))
            .toList(),
      ),
    );
  }
}
