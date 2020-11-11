import 'package:flutter/material.dart';
import '../models/transaction.dart';

import 'new_transaction.dart';
import 'user_transaction.dart';

class Transaction extends StatefulWidget {
  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  final List<TransactionData> _transactions = [
    TransactionData(
        amount: 10.99,
        id: 'id',
        title: 'Shoes',
        transactionDate: DateTime.now()),
    TransactionData(
        amount: 10.99,
        id: 'id',
        title: 'Shoes',
        transactionDate: DateTime.now()),
    TransactionData(
        amount: 10.99,
        id: 'id',
        title: 'Shoes',
        transactionDate: DateTime.now()),
    TransactionData(
        amount: 10.99,
        id: 'id',
        title: 'Shoes',
        transactionDate: DateTime.now()),
    TransactionData(
        amount: 10.99,
        id: 'id',
        title: 'Shoes',
        transactionDate: DateTime.now()),
    TransactionData(
        amount: 10.99,
        id: 'id',
        title: 'Shoes',
        transactionDate: DateTime.now()),
    TransactionData(
        amount: 10.99,
        id: 'id',
        title: 'Shoes',
        transactionDate: DateTime.now()),
    TransactionData(
        amount: 10.99,
        id: 'id',
        title: 'Shoes',
        transactionDate: DateTime.now()),
    TransactionData(
        amount: 10.99,
        id: 'id',
        title: 'Shoes',
        transactionDate: DateTime.now()),
    TransactionData(
        amount: 10.99,
        id: 'id',
        title: 'Shoes',
        transactionDate: DateTime.now()),
    TransactionData(
        amount: 10.99,
        id: 'id',
        title: 'Shoes',
        transactionDate: DateTime.now()),
    TransactionData(
        amount: 10.99,
        id: 'id',
        title: 'Shoes',
        transactionDate: DateTime.now()),
  ];
  void _addTransaction(String txTitle, double txAmount) {
    final newTx = TransactionData(
      title: txTitle,
      amount: txAmount,
      transactionDate: DateTime.now(),
      id: DateTime.now().toString(),
    );

    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addTransaction),
        TransactionList(_transactions),
      ],
    );
  }
}
