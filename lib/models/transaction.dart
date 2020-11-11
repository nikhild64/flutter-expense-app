import 'package:flutter/material.dart';

class TransactionData {
  String id;
  String title;
  double amount;
  DateTime transactionDate;
  TransactionData(
      {@required this.amount,
      @required this.id,
      @required this.title,
      @required this.transactionDate});
}
