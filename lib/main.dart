import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'dart:math';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  //

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        // Cor padrao do sistema
        primarySwatch: Colors.purple,
        // Cor de realce de alguns botoes'
        accentColor: Colors.amber,
        // Aplicando Fonts
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSabs',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              button: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //

  final List<Transaction> _transactions = <Transaction>[
    Transaction(
      id: 't0',
      title: 'Novo tenis de corrida',
      value: 400.78,
      date: DateTime.now().subtract(Duration(days: 9)),
    ),
    Transaction(
      id: 't1',
      title: 'Novo tenis de corrida 2',
      value: 301.78,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Internet',
      value: 255.7,
      date: DateTime.now().subtract(Duration(days: 4)),
    ),
    Transaction(
      id: 't3',
      title: 'Compra Debidot',
      value: 45000.73,
      date: DateTime.now().subtract(Duration(days: 3)),
    ),
    Transaction(
      id: 't4',
      title: 'Conta de Gaz',
      value: 11.65,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
    Transaction(
      id: 't5',
      title: 'Cartao de Crédito',
      value: 255000.73,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't6',
      title: 'Conta de Luz',
      value: 11.65,
      date: DateTime.now(),
    )
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

    Navigator.of(context).pop();
  }

  List<Transaction> get _recentTransactions {
    return _transactions
        .where((element) => element.date.isAfter(DateTime.now().subtract(
              Duration(days: 7),
            )))
        .toList();
  }

  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // O main AxisAlignment pode variar conforme o tipo de
          // componente utilizado. Column(Cima -> baixo), Row (Esquerda -> direita)
          // - mainAxisAlignment: MainAxisAlignment.spaceAround,
          // stretch é utilizado para ocupar a área inteira da coluna
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_transactions),
          ],
        ),
      ),
      // Método que tem a função de inserir um botão no rodapé
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openTransactionFormModal(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
