import 'package:flutter/material.dart';
import 'package:questao_3/consts/app_color.dart';

class Button<T> extends StatelessWidget {
  const Button({
    super.key,
    required this.onPressed,
    required this.value,
    required this.symbol,
    this.color = AppColor.defaultColor,
    this.isBig = false,
  });

  const Button.big(
      {super.key,
      required this.onPressed,
      required this.value,
      required this.symbol,
      this.color = AppColor.defaultColor,
      this.isBig = true});

  const Button.operation({
    super.key,
    required this.onPressed,
    required this.value,
    required this.symbol,
    this.color = AppColor.operationColor,
    this.isBig = false,
  });

  final Function(T) onPressed;
  final T value;
  final String symbol;
  final Color color;
  final bool isBig;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isBig ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.all(0.5),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: this.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
          ),
          onPressed: () => onPressed(value),
          child: Text(
            this.symbol,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w200,
            ),
          ),
        ),
      ),
    );
  }
}
