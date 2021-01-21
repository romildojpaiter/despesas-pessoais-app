import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

/// Classe responsável por manter o compoente de Transaction
class TransactionList extends StatelessWidget {
  //
  final List<Transaction> transactions;

  /// Recebendo por paremtro as transaction
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: transactions.map((tr) {
        return Card(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 10,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.purple,
                    width: 2,
                  ),
                ),
                padding: EdgeInsets.all(10),
                child: Text(
                  'R\$ ${tr.value.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.purple,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                // para Column, é alinhado a linha no crossAxis
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(tr.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      )),
                  Text(
                    DateFormat('d MMM y').format(tr.date),
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              )
            ],
          ),
        );
      }).toList(),
    );
  }
}
