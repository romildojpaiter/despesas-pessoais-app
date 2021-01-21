import 'package:flutter/material.dart';

/// Classe responsável por manter o Formulario de Cadastro do Form
class TransactionForm extends StatelessWidget {
  //

  @override
  Widget build(BuildContext context) {
    //
    final titleControler = TextEditingController();
    final valueControler = TextEditingController();

    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: titleControler,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: valueControler,
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
              // Utilizado para mostrar o tipo do teclado
              keyboardType: TextInputType.number,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text('Nova Transação'),
                  textColor: Colors.purple,
                  onPressed: () {
                    print(titleControler.text);
                    print(valueControler.text);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
