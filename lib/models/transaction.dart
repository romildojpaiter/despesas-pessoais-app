import 'package:flutter/foundation.dart';

/// Construção de classe para exibir as transações
class Transaction {
  final String id;
  final String title;
  final double value;
  final DateTime date;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.value,
    @required this.date,
  });
}
