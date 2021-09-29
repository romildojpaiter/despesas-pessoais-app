import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class AdaptativeTextField extends StatelessWidget {
  //

  final String label;
  final TextEditingController controller;
  final TextInputType textInputType;
  final Function(String) onSubmitted;

  AdaptativeTextField({
    this.label,
    this.controller,
    this.textInputType = TextInputType.text,
    this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(
              bottom: 8,
            ),
            child: CupertinoTextField(
              controller: controller,
              onSubmitted: onSubmitted,
              keyboardType: textInputType,
              placeholder: label,
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: controller,
            decoration: InputDecoration(labelText: label),
            onSubmitted: onSubmitted,
            // Utilizado para mostrar o tipo do teclado
            keyboardType: textInputType,
          );
  }
}
