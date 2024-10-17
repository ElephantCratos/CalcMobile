import 'calc_operations/operations_barrel.dart';

class CalcLogic {
  double? firstNum;
  double? secondNum;
  String result = "0";
  String expression = "";
  String operand = "";
  bool isOperationCompleted = false;
  bool isOperandChosen = false;
  bool isSecondNumInputStarted = false;

  final List<String> operators = ['+', '-', '*', '/', '**'];

  final Map<String, Operation> operations = {
    '+': Add(),
    '-': Subtract(),
    '*': Multiply(),
    '/': Divide(),
    '**': Exponintation(),
  };

  String handleInput(String buttonText) {
    if (isOperationCompleted && buttonText != "C") {
      return result;
    }

    if (buttonText == "C") {
      setDefaultValues();
      return result;
    }

    if (isNumber(buttonText)) {
      return handleNumberInput(buttonText);
    }

    if (buttonText == ".") {
      return handleDotInput();
    }

    if (operators.contains(buttonText)) {
      return setOperand(buttonText);
    }

    if (buttonText == "=") {
      return setExpressionResult();
    }

    return result;
  }

  String handleNumberInput(String buttonText) {
    if (result == "0" || (isOperandChosen && !isSecondNumInputStarted)) {
      result = buttonText;
      isSecondNumInputStarted = isOperandChosen;
    } else {
      if (result.length > 15) {
        return result;
      }
      result += buttonText;
    }
    expression += buttonText;
    return result;
  }

  String handleDotInput() {
    if (!result.contains(".")) {
      result += ".";
      expression += ".";
    }
    return result;
  }

  String setOperand(String inputOperand) {
    if (firstNum == null) {
      firstNum = double.parse(result);
      operand = inputOperand;
      isOperandChosen = true;
      result == "0"
          ? expression += result + inputOperand
          : expression += inputOperand;

      return operand;
    } else if (isOperandChosen && !isSecondNumInputStarted) {
      expression = expression.substring(0, expression.length - operand.length) +
          inputOperand;
      operand = inputOperand;

      return operand;
    }

    return result;
  }

  String setExpressionResult() {
    if (firstNum != null && isOperandChosen) {
      if (!isSecondNumInputStarted) {
        return result;
      }

      secondNum = double.parse(result);

      final operation = operations[operand];
      if (operation != null && secondNum != null) {
        try {
          double operationResult = operation.execute(firstNum!, secondNum!);
          result = formatResult(operationResult);
          expression += " = $result";
        } catch (e) {
          result = "Error";
        }
      }
      isOperationCompleted = true;
    }
    return result;
  }

  void setDefaultValues() {
    operand = "";
    firstNum = null;
    secondNum = null;
    result = "0";
    expression = "";
    isOperationCompleted = false;
    isOperandChosen = false;
    isSecondNumInputStarted = false;
  }

  bool isNumber(String buttonText) {
    return double.tryParse(buttonText) != null;
  }

  String getExpression() {
    return expression;
  }

  String formatResult(double result) {
    if (result == result.toInt()) {
      return result.toInt().toString();
    } else {
      return result.toStringAsFixed(8);
    }
  }
}
