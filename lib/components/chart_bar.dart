import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  //
  final String label;
  final double sumDay;
  final double percent;

  // Utilizando as {} (chaves), utilizamos os valores nomeados.
  ChartBar({this.label, this.percent, this.sumDay});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          child: Text('${sumDay.toStringAsFixed(2)}'),
        ),
        SizedBox(height: 5),
        Container(
          height: 80,
          width: 10,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 1.0,
                    ),
                    color: Color.fromRGBO(220, 220, 220, 1),
                    borderRadius: BorderRadius.circular(5)),
              ),
              FractionallySizedBox(
                heightFactor: percent,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(label)
      ],
    );
  }
}
