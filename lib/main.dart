import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  //

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Despesas Pessoais"),
      ),
      body: Column(
        // O main AxisAlignment pode variar conforme o tipo de
        // componente utilizado. Column(Cima -> baixo), Row (Esquerda -> direita)
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // stretch é utilizado para ocupar a área inteira da coluna
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          Column(
            children: _transactions.map((tr) {
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
                          fontSize: 20,
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
                          tr.date.toString(),
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
