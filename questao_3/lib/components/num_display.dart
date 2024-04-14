import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class NumDisplay extends StatelessWidget {
  const NumDisplay({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Padding>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AutoSizeText(
              text,
              minFontSize: 20,
              maxFontSize: 80,
              maxLines: 1,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontWeight: FontWeight.w100,
                decoration: TextDecoration.none,
                fontSize: 80,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
