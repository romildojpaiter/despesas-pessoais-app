import 'dart:math';
import 'dart:io';

import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  //

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        // Cor padrao do sistema
        fontFamily: 'Quicksand',
        textTheme: ThemeData.light().textTheme.copyWith(
              subtitle1: TextStyle(
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
          toolbarTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
            .copyWith(secondary: Colors.amber),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  //
  final List<Transaction> _transactions = <Transaction>[];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  /// Função responsavel por receber os valores solicitados no formulario
  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = Transaction(
        id: Random().nextDouble().toString(),
        date: date,
        title: title,
        value: value);

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  _removeTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
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
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(
      title: Text('Despesas Pessoais'),
      actions: [
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(context),
        ),
      ],
    );

    final availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          // O main AxisAlignment pode variar conforme o tipo de
          // componente utilizado. Column(Cima -> baixo), Row (Esquerda -> direita)
          // - mainAxisAlignment: MainAxisAlignment.spaceAround,
          // stretch é utilizado para ocupar a área inteira da coluna
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Gráfico semanal',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: availableHeight * 0.26,
              child: Chart(_recentTransactions),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Despesas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: availableHeight * 0.6,
              child: TransactionList(_transactions, _removeTransaction),
            ),
          ],
        ),
      ),
      // Método que tem a função de inserir um botão no rodapé
      floatingActionButton: Platform.isIOS
          ? Container()
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () => _openTransactionFormModal(context),
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
