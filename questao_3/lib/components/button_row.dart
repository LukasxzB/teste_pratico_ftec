import 'package:flutter/material.dart';
import 'package:questao_3/components/button.dart';

class ButtonRow extends StatelessWidget {
  const ButtonRow({super.key, required this.buttons});

  final List<Button> buttons;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: buttons.fold(<Widget>[], (list, button) {
          list.add(button);
          return list;
        }),
      ),
    );
  }
}
