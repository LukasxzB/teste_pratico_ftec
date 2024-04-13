enum Number {
  zero,
  one,
  two,
  three,
  four,
  five,
  six,
  seven,
  eight,
  nine,
}

extension NumberSymbol on Number {
  String get symbol {
    switch (this) {
      case Number.zero:
        return '0';
      case Number.one:
        return '1';
      case Number.two:
        return '2';
      case Number.three:
        return '3';
      case Number.four:
        return '4';
      case Number.five:
        return '5';
      case Number.six:
        return '6';
      case Number.seven:
        return '7';
      case Number.eight:
        return '8';
      case Number.nine:
        return '9';
    }
  }
}
