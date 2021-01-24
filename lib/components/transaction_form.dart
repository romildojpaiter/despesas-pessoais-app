import 'package:flutter/material.dart';

/// Classe responsável por manter o Formulario de Cadastro do Form
class TransactionForm extends StatefulWidget {
  //
  final void Function(String, double) onSubmit;

  TransactionForm(this.onSubmit);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleControler = TextEditingController();

  final valueControler = TextEditingController();

  _submitForm() {
    final title = titleControler.text;
    final value = double.tryParse(valueControler.text) ?? 0.0;

    if (title.isEmpty || value <= 0) {
      return;
    }

    widget.onSubmit(title, value);
  }

  @override
  Widget build(BuildContext context) {
    //

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
              onSubmitted: (_) => _submitForm(),
              // Utilizado para mostrar o tipo do teclado
              keyboardType: TextInputType.numberWithOptions(decimal: true),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text('Nova Transação'),
                  textColor: Colors.purple,
                  onPressed: _submitForm,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
