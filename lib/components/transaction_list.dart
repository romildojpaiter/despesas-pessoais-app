import 'package:expenses/components/transaction_item.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

/// Classe responsável por manter o compoente de Transaction
class TransactionList extends StatelessWidget {
  //
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  /// Recebendo por paremtro as transaction
  TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Nenhuma transação cadastrada',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: 200,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              )
            ],
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final tr = transactions[index]; // Definiçao do item da lista
              return TransactionItem(
                tr: tr,
                onRemove: onRemove,
              );
            });
  }
}
