import 'package:flutter/material.dart';

class ChartData extends StatelessWidget {
  final _transactionData;
  final _percantageData;
  ChartData(this._transactionData, this._percantageData);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text('\$${_transactionData['amount'].toString()}'),
          Container(
            height: 80,
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
          Text(_transactionData['day']),
        ],
      ),
    );
  }
}
