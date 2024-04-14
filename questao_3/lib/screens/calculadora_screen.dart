import 'package:flutter/material.dart';
import 'package:questao_3/components/num_display.dart';
import 'package:questao_3/components/num_keyboard.dart';
import 'package:questao_3/consts/app_color.dart';
import 'package:questao_3/types/number.dart';
import 'package:questao_3/types/operation.dart';

class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  State<CalculadoraScreen> createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  String _firstNumberDisplay = '';
  String _secondNumberDisplay = '';
  Operation? _operation;
  bool _gotError = false;
  bool _isResult = false;

  void _cleanAll() {
    setState(() {
      _firstNumberDisplay = '';
      _secondNumberDisplay = '';
      _operation = null;
      _gotError = false;
      _isResult = false;
    });
  }

  void _clean() {
    setState(() {
      if (_secondNumberDisplay.isNotEmpty) {
        _secondNumberDisplay =
            _secondNumberDisplay.substring(0, _secondNumberDisplay.length - 1);
      } else if (_operation != null) {
        _operation = null;
      } else if (_firstNumberDisplay.isNotEmpty) {
        _firstNumberDisplay =
            _firstNumberDisplay.substring(0, _firstNumberDisplay.length - 1);
      } else if (_gotError) {
        _cleanAll();
      }
    });
  }

  void _calculate() {
    if (_secondNumberDisplay.isEmpty) {
      return;
    }

    final double firstNumber = double.parse(_firstNumberDisplay);
    final double secondNumber = double.parse(_secondNumberDisplay);

    double result = 0;
    _isResult = true;

    switch (_operation) {
      case Operation.add:
        result = firstNumber + secondNumber;
        break;
      case Operation.divide:
        if (secondNumber == 0) {
          _gotError = true;
          break;
        }

        result = firstNumber / secondNumber;
        break;
      case Operation.multiply:
        result = firstNumber * secondNumber;
        break;
      case Operation.subtract:
        result = firstNumber - secondNumber;
        break;
      default:
        break;
    }

    setState(() {
      _firstNumberDisplay = result.toString();
      _secondNumberDisplay = '';
      _operation = null;
    });
  }

  void _addDot() {
    if (_operation == null) {
      final String append = _firstNumberDisplay.isEmpty ? '0.' : '.';
      if (!_firstNumberDisplay.contains(Operation.dot.symbol)) {
        _firstNumberDisplay += append;
      }
      return;
    }

    final String append = _secondNumberDisplay.isEmpty ? '0.' : '.';
    if (!_secondNumberDisplay.contains(Operation.dot.symbol)) {
      _secondNumberDisplay += append;
    }
    return;
  }

  void _setOperation(Operation operation) {
    if (_gotError) {
      _cleanAll();
    }

    if (_isResult) {
      _isResult = false;
    }

    if (_firstNumberDisplay.isNotEmpty &&
        _firstNumberDisplay.characters.last == Operation.dot.symbol) {
      setState(() {
        _firstNumberDisplay =
            _firstNumberDisplay.substring(0, _firstNumberDisplay.length - 1);
      });
    }

    setState(() {
      // Casos especiais, onde a operação faz algo diferente
      switch (operation) {
        case Operation.clean:
          _clean();
          return;
        case Operation.cleanAll:
          _cleanAll();
          return;
        case Operation.dot:
          _addDot();
          return;
        case Operation.equal:
          _calculate();
          return;
        default:
          if (_secondNumberDisplay.isNotEmpty) {
            return;
          }

          if (_firstNumberDisplay.isEmpty) {
            _firstNumberDisplay = Number.zero.symbol;
            _operation = operation;
          }

          _operation = operation;
      }
    });
  }

  void _addNumber(Number number) {
    if (_gotError) {
      _cleanAll();
    }

    setState(() {
      if (_isResult) {
        _cleanAll();
      }

      if (_operation == null) {
        _firstNumberDisplay += number.symbol;
        return;
      }

      _secondNumberDisplay += number.symbol;
    });
  }

  String _getDisplayText() {
    if (_gotError) {
      return 'ERROR';
    }

    String operationText = _operation?.symbol ?? '';
    return '$_firstNumberDisplay$operationText$_secondNumberDisplay';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.appBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            NumDisplay(text: _getDisplayText()),
            NumKeyboard(
              onOperationPressed: _setOperation,
              onNumberPressed: _addNumber,
            ),
          ],
        ),
      ),
    );
  }
}
