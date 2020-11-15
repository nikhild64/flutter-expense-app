import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<TransactionData> _transactions;
  final Function deleteTx;
  TransactionList(this._transactions, this.deleteTx);
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
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        leading: CircleAvatar(
                            backgroundColor:
                                Theme.of(context).primaryColorLight,
                            radius: 30,
                            child: Text(
                              '\$${_transactions[index].amount.toStringAsFixed(2)}',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorDark),
                            )),
                        title: Text(_transactions[index].title,
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        subtitle: Text(
                          DateFormat()
                              .add_yMMMd()
                              .format(_transactions[index].transactionDate),
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            deleteTx(_transactions[index].id);
                          },
                          color: Colors.red,
                        ),
                      ),
                    ),
                  );
                },
                itemCount: _transactions.length,
              ));
  }
}
