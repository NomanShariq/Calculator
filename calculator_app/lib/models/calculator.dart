class Calculator {
  double _operand1 = 0;
  double _operand2 = 0;
  String _operation = '';

  void setOperand(double operand) {
    if (_operation.isEmpty) {
      _operand1 = operand;
    } else {
      _operand2 = operand;
    }
  }

  void setOperation(String operation) {
    _operation = operation;
  }

  double getResult() {
    double result;

    switch (_operation) {
      case '+':
        result = _operand1 + _operand2;
        break;
      case '-':
        result = _operand1 - _operand2;
        break;
      case '*':
        result = _operand1 * _operand2;
        break;
      case '/':
        result = _operand1 / _operand2;
        break;
      default:
        result = 0;
    }

    return result;
  }

  void reset() {
    _operand1 = 0;
    _operand2 = 0;
    _operation = '';
  }
}
