import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionData> _transactions;
  TransactionList(this._transactions);
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        child: _transactions.length == 0
            ? Column(
                children: [
                  Card(
                    child: Text('No Transactions yet!!'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 350,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              )
            : ListView.builder(
                itemBuilder: (context, index) {
                  return (Container(
                    width: double.infinity,
                    child: Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 2),
                            ),
                            child: Text(
                              '\$${_transactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            padding: EdgeInsets.all(5),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(_transactions[index].title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                              Text(
                                DateFormat().add_yMMMd().format(
                                    _transactions[index].transactionDate),
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ));
                },
                itemCount: _transactions.length,
              ));
  }
}
