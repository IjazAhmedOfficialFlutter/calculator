import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: CalculatorHome(),
    );
  }
}

class CalculatorHome extends StatefulWidget {
  @override
  _CalculatorHomeState createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  String _display = "0"; // To show the full expression
  String _currentInput = "0";
  double _firstOperand = 0;
  String _operator = "";
  bool _operatorPressed = false;

  void _onButtonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        _clear();
      } else if (buttonText == "⌫") {
        _delete();
      } else if (["+", "-", "×", "÷"].contains(buttonText)) {
        _setOperator(buttonText);
      } else if (buttonText == "=") {
        _calculateResult();
      } else if (buttonText == ".") {
        _addDecimal();
      } else {
        _appendNumber(buttonText);
      }
    });
  }

  void _clear() {
    _display = "0";
    _currentInput = "0";
    _firstOperand = 0;
    _operator = "";
    _operatorPressed = false;
  }

  void _delete() {
    if (_currentInput.length > 1) {
      _currentInput = _currentInput.substring(0, _currentInput.length - 1);
    } else {
      _currentInput = "0";
    }
    _updateDisplay();
  }

  void _setOperator(String operator) {
    if (_currentInput != "0" && !_operatorPressed) {
      // Update the first operand only if it's a valid number
      _firstOperand = double.parse(_currentInput);
      _operator = operator;
      _operatorPressed = true;
      // Append the operator to the display with the current input
      _display += " $operator ";
      _currentInput = "0"; // Reset current input for the next number
    }
  }

  void _calculateResult() {
    if (_operator.isNotEmpty && _currentInput != "0") {
      double secondOperand = double.parse(_currentInput);
      double result = 0;

      switch (_operator) {
        case "+":
          result = _firstOperand + secondOperand;
          break;
        case "-":
          result = _firstOperand - secondOperand;
          break;
        case "×":
          result = _firstOperand * secondOperand;
          break;
        case "÷":
          result = secondOperand != 0 ? _firstOperand / secondOperand : 0;
          break;
      }

      // Format the result to show only six digits after the decimal point
      _display = result.toStringAsFixed(6);
      _currentInput = _display; // Update current input to the formatted result
      _operator = "";
      _operatorPressed = false;
    }
  }

  void _addDecimal() {
    if (!_currentInput.contains(".")) {
      _currentInput += ".";
      _updateDisplay();
    }
  }

  void _appendNumber(String number) {
    if (_currentInput == "0" || _operatorPressed) {
      _currentInput = number; // Start a new number
      _operatorPressed = false; // Reset operator pressed state
    } else {
      _currentInput += number; // Append to the existing number
    }
    _updateDisplay();
  }

  void _updateDisplay() {
    if (_operator.isNotEmpty) {
      _display = '$_firstOperand $_operator $_currentInput'; // Show expression
    } else {
      _display = _currentInput; // Show current input if no operator
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                _display,
                style: TextStyle(fontSize: 48.0, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            _buildButtonGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonGrid() {
    return Column(
      children: [
        _buildButtonRow(["C", "⌫", "÷"]),
        _buildButtonRow(["7", "8", "9", "×"]),
        _buildButtonRow(["4", "5", "6", "-"]),
        _buildButtonRow(["1", "2", "3", "+"]),
        _buildButtonRow(["0", ".", "="]),
      ],
    );
  }

  Widget _buildButtonRow(List<String> buttons) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: buttons.map((buttonText) {
        return _buildButton(buttonText);
      }).toList(),
    );
  }

  Widget _buildButton(String buttonText) {
    Color buttonColor = _getButtonColor(buttonText);

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _onButtonPressed(buttonText),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: CircleBorder(),
          padding: EdgeInsets.all(20.0),
          minimumSize: Size(70, 70),
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }

  Color _getButtonColor(String buttonText) {
    if (buttonText == "C" || buttonText == "⌫") {
      return Colors.redAccent;
    } else if (["+", "-", "×", "÷", "="].contains(buttonText)) {
      return Colors.blueAccent;
    } else {
      return Colors.grey[800]!;
    }
  }
}
