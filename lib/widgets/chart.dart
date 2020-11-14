import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chart_data.dart';

class Chart extends StatefulWidget {
  final List<TransactionData> _transactinData;
  Chart(this._transactinData);
  List<Map<String, Object>> get _recentData {
    return List.generate(7, (index) {
      var weekDay = DateTime.now().subtract(Duration(days: index));
      double _amountTotal = 0;
      for (var i = 0; i < _transactinData.length; i++) {
        if (weekDay.day == _transactinData[i].transactionDate.day &&
            weekDay.month == _transactinData[i].transactionDate.month &&
            weekDay.year == _transactinData[i].transactionDate.year) {
          _amountTotal = _amountTotal + _transactinData[i].amount;
        }
      }

      return {'day': DateFormat.E().format(weekDay), 'amount': _amountTotal};
    }).reversed.toList();
  }

  double get _totalWeekly {
    var finalValue = _recentData.fold(
        0, (previousValue, rd) => previousValue + rd['amount']);
    print(finalValue);
    return finalValue;
  }

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: widget._recentData.map((rd) {
        return Container(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * .01),
          child: ChartData(
              rd,
              widget._totalWeekly == 0
                  ? 0.0
                  : ((rd['amount'] as double) / widget._totalWeekly)),
        );
      }).toList(),
    );
  }
}
