import 'package:flutter/material.dart';

class ChartData extends StatelessWidget {
  final _transactionData;
  final _percantageData;
  ChartData(this._transactionData, this._percantageData);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return (Column(
        children: [
          Container(
              padding: EdgeInsets.all(constraints.maxHeight * .03),
              child:
                  Text('\$${_transactionData['amount'].toStringAsFixed(2)}')),
          SizedBox(height: constraints.maxHeight * .05),
          Container(
            height: constraints.maxHeight * .6,
            width: 10,
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1.0),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                FractionallySizedBox(
                  heightFactor: _percantageData,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: constraints.maxHeight * .05),
          Text(_transactionData['day']),
        ],
      ));
    });
  }
}
