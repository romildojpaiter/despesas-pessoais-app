import 'dart:math';

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';

class TransactionUser extends StatefulWidget {
  //
  @override
  _TransactionUserState createState() => _TransactionUserState();
  //
}

class _TransactionUserState extends State<TransactionUser> {
  //

  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tenis de corrida',
      value: 301.78,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Internet',
      value: 255.7,
      date: DateTime.now(),
    ),
  ];

  /// Função responsavel por receber os valores solicitados no formulario
  _addTransaction(String title, double value) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        date: DateTime.now(),
        title: title,
        value: value);

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      TransactionList(_transactions),
      TransactionForm(_addTransaction),
    ]);
  }
}
