import 'package:flutter/material.dart';
import 'package:questao_3/components/button.dart';
import 'package:questao_3/components/button_row.dart';
import 'package:questao_3/consts/app_color.dart';
import 'package:questao_3/types/number.dart';
import 'package:questao_3/types/operation.dart';

class NumKeyboard extends StatelessWidget {
  const NumKeyboard({
    super.key,
    required this.onOperationPressed,
    required this.onNumberPressed,
  });

  final void Function(Operation) onOperationPressed;
  final void Function(Number) onNumberPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 550,
      child: Column(
        children: <Widget>[
          ButtonRow(
            buttons: <Button>[
              Button<Operation>.big(
                onPressed: onOperationPressed,
                value: Operation.cleanAll,
                symbol: Operation.cleanAll.symbol,
                color: AppColor.darkColor,
              ),
              Button<Operation>.operation(
                onPressed: onOperationPressed,
                value: Operation.clean,
                symbol: Operation.clean.symbol,
                color: AppColor.darkColor,
              ),
              Button<Operation>.operation(
                onPressed: onOperationPressed,
                value: Operation.divide,
                symbol: Operation.divide.symbol,
              ),
            ],
          ),
          ButtonRow(
            buttons: <Button>[
              Button<Number>(
                onPressed: onNumberPressed,
                value: Number.seven,
                symbol: Number.seven.symbol,
              ),
              Button<Number>(
                onPressed: onNumberPressed,
                value: Number.eight,
                symbol: Number.eight.symbol,
              ),
              Button<Number>(
                onPressed: onNumberPressed,
                value: Number.nine,
                symbol: Number.nine.symbol,
              ),
              Button<Operation>.operation(
                onPressed: onOperationPressed,
                value: Operation.multiply,
                symbol: Operation.multiply.symbol,
              ),
            ],
          ),
          ButtonRow(
            buttons: <Button>[
              Button<Number>(
                onPressed: onNumberPressed,
                value: Number.four,
                symbol: Number.four.symbol,
              ),
              Button<Number>(
                onPressed: onNumberPressed,
                value: Number.five,
                symbol: Number.five.symbol,
              ),
              Button<Number>(
                onPressed: onNumberPressed,
                value: Number.six,
                symbol: Number.six.symbol,
              ),
              Button<Operation>.operation(
                onPressed: onOperationPressed,
                value: Operation.subtract,
                symbol: Operation.subtract.symbol,
              ),
            ],
          ),
          ButtonRow(
            buttons: <Button>[
              Button<Number>(
                onPressed: onNumberPressed,
                value: Number.one,
                symbol: Number.one.symbol,
              ),
              Button<Number>(
                onPressed: onNumberPressed,
                value: Number.two,
                symbol: Number.two.symbol,
              ),
              Button<Number>(
                onPressed: onNumberPressed,
                value: Number.three,
                symbol: Number.three.symbol,
              ),
              Button<Operation>.operation(
                onPressed: onOperationPressed,
                value: Operation.add,
                symbol: Operation.add.symbol,
              ),
            ],
          ),
          ButtonRow(
            buttons: <Button>[
              Button<Number>.big(
                onPressed: onNumberPressed,
                value: Number.zero,
                symbol: Number.zero.symbol,
              ),
              Button<Operation>(
                onPressed: onOperationPressed,
                value: Operation.dot,
                symbol: Operation.dot.symbol,
              ),
              Button<Operation>.operation(
                onPressed: onOperationPressed,
                value: Operation.equal,
                symbol: Operation.equal.symbol,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
