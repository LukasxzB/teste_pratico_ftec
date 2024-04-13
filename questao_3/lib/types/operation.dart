enum Operation {
  add,
  divide,
  multiply,
  subtract,
  cleanAll,
  clean,
  dot,
  equal,
}

extension OperationSymbol on Operation {
  String get symbol {
    switch (this) {
      case Operation.add:
        return '+';
      case Operation.divide:
        return '/';
      case Operation.multiply:
        return '×';
      case Operation.subtract:
        return '-';
      case Operation.cleanAll:
        return 'AC';
      case Operation.clean:
        return '🡐';
      case Operation.dot:
        return '.';
      case Operation.equal:
        return '=';
    }
  }
}
