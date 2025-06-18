// // // // import 'package:flutter/material.dart';
// // // //
// // // // class CalculatorApp extends StatelessWidget {
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return MaterialApp(
// // // //       debugShowCheckedModeBanner: false,
// // // //       theme: ThemeData(
// // // //         primarySwatch: Colors.blue,
// // // //         brightness: Brightness.dark,
// // // //       ),
// // // //       home: CalculatorHome(),
// // // //     );
// // // //   }
// // // // }
// // // //
// // // // class CalculatorHome extends StatefulWidget {
// // // //   @override
// // // //   _CalculatorHomeState createState() => _CalculatorHomeState();
// // // // }
// // // //
// // // // class _CalculatorHomeState extends State<CalculatorHome> {
// // // //   String _display = "0"; // To show the full expression
// // // //   String _currentInput = "0";
// // // //   double _firstOperand = 0;
// // // //   String _operator = "";
// // // //   bool _operatorPressed = false;
// // // //
// // // //   void _onButtonPressed(String buttonText) {
// // // //     setState(() {
// // // //       if (buttonText == "C") {
// // // //         _clear();
// // // //       } else if (buttonText == "⌫") {
// // // //         _delete();
// // // //       } else if (["+", "-", "×", "÷"].contains(buttonText)) {
// // // //         _setOperator(buttonText);
// // // //       } else if (buttonText == "=") {
// // // //         _calculateResult();
// // // //       } else if (buttonText == ".") {
// // // //         _addDecimal();
// // // //       } else {
// // // //         _appendNumber(buttonText);
// // // //       }
// // // //     });
// // // //   }
// // // //
// // // //   void _clear() {
// // // //     _display = "0";
// // // //     _currentInput = "0";
// // // //     _firstOperand = 0;
// // // //     _operator = "";
// // // //     _operatorPressed = false;
// // // //   }
// // // //
// // // //   void _delete() {
// // // //     if (_currentInput.length > 1) {
// // // //       _currentInput = _currentInput.substring(0, _currentInput.length - 1);
// // // //     } else {
// // // //       _currentInput = "0";
// // // //     }
// // // //     _updateDisplay();
// // // //   }
// // // //
// // // //   void _setOperator(String operator) {
// // // //     if (_currentInput != "0" && !_operatorPressed) {
// // // //       // Update the first operand only if it's a valid number
// // // //       _firstOperand = double.parse(_currentInput);
// // // //       _operator = operator;
// // // //       _operatorPressed = true;
// // // //       // Append the operator to the display with the current input
// // // //       _display += " $operator ";
// // // //       _currentInput = "0"; // Reset current input for the next number
// // // //     }
// // // //   }
// // // //
// // // //   void _calculateResult() {
// // // //     if (_operator.isNotEmpty && _currentInput != "0") {
// // // //       double secondOperand = double.parse(_currentInput);
// // // //       double result = 0;
// // // //
// // // //       switch (_operator) {
// // // //         case "+":
// // // //           result = _firstOperand + secondOperand;
// // // //           break;
// // // //         case "-":
// // // //           result = _firstOperand - secondOperand;
// // // //           break;
// // // //         case "×":
// // // //           result = _firstOperand * secondOperand;
// // // //           break;
// // // //         case "÷":
// // // //           result = secondOperand != 0 ? _firstOperand / secondOperand : 0;
// // // //           break;
// // // //       }
// // // //
// // // //       // Format the result to show only six digits after the decimal point
// // // //       _display = result.toStringAsFixed(6);
// // // //       _currentInput = _display; // Update current input to the formatted result
// // // //       _operator = "";
// // // //       _operatorPressed = false;
// // // //     }
// // // //   }
// // // //
// // // //   void _addDecimal() {
// // // //     if (!_currentInput.contains(".")) {
// // // //       _currentInput += ".";
// // // //       _updateDisplay();
// // // //     }
// // // //   }
// // // //
// // // //   void _appendNumber(String number) {
// // // //     if (_currentInput == "0" || _operatorPressed) {
// // // //       _currentInput = number; // Start a new number
// // // //       _operatorPressed = false; // Reset operator pressed state
// // // //     } else {
// // // //       _currentInput += number; // Append to the existing number
// // // //     }
// // // //     _updateDisplay();
// // // //   }
// // // //
// // // //   void _updateDisplay() {
// // // //     if (_operator.isNotEmpty) {
// // // //       _display = '$_firstOperand $_operator $_currentInput'; // Show expression
// // // //     } else {
// // // //       _display = _currentInput; // Show current input if no operator
// // // //     }
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: Colors.black,
// // // //       body: Padding(
// // // //         padding: const EdgeInsets.all(16.0),
// // // //         child: Column(
// // // //           mainAxisAlignment: MainAxisAlignment.end,
// // // //           children: <Widget>[
// // // //             Align(
// // // //               alignment: Alignment.centerRight,
// // // //               child: Text(
// // // //                 _display,
// // // //                 style: TextStyle(fontSize: 48.0, color: Colors.white),
// // // //               ),
// // // //             ),
// // // //             SizedBox(height: 20),
// // // //             _buildButtonGrid(),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   Widget _buildButtonGrid() {
// // // //     return Column(
// // // //       children: [
// // // //         _buildButtonRow(["C", "⌫", "÷"]),
// // // //         _buildButtonRow(["7", "8", "9", "×"]),
// // // //         _buildButtonRow(["4", "5", "6", "-"]),
// // // //         _buildButtonRow(["1", "2", "3", "+"]),
// // // //         _buildButtonRow(["0", ".", "="]),
// // // //       ],
// // // //     );
// // // //   }
// // // //
// // // //   Widget _buildButtonRow(List<String> buttons) {
// // // //     return Row(
// // // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //       children: buttons.map((buttonText) {
// // // //         return _buildButton(buttonText);
// // // //       }).toList(),
// // // //     );
// // // //   }
// // // //
// // // //   Widget _buildButton(String buttonText) {
// // // //     Color buttonColor = _getButtonColor(buttonText);
// // // //
// // // //     return Padding(
// // // //       padding: EdgeInsets.all(8.0),
// // // //       child: ElevatedButton(
// // // //         onPressed: () => _onButtonPressed(buttonText),
// // // //         style: ElevatedButton.styleFrom(
// // // //           backgroundColor: buttonColor,
// // // //           shape: CircleBorder(),
// // // //           padding: EdgeInsets.all(20.0),
// // // //           minimumSize: Size(70, 70),
// // // //         ),
// // // //         child: Text(
// // // //           buttonText,
// // // //           style: TextStyle(fontSize: 24, color: Colors.white),
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   Color _getButtonColor(String buttonText) {
// // // //     if (buttonText == "C" || buttonText == "⌫") {
// // // //       return Colors.redAccent;
// // // //     } else if (["+", "-", "×", "÷", "="].contains(buttonText)) {
// // // //       return Colors.blueAccent;
// // // //     } else {
// // // //       return Colors.grey[800]!;
// // // //     }
// // // //   }
// // // // }
// // //
// // // import 'package:flutter/material.dart';
// // //
// // // class CalculatorApp extends StatelessWidget {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return MaterialApp(
// // //       debugShowCheckedModeBanner: false,
// // //       theme: ThemeData(
// // //         primarySwatch: Colors.blue,
// // //         brightness: Brightness.dark,
// // //       ),
// // //       home: CalculatorHome(),
// // //     );
// // //   }
// // // }
// // //
// // // class CalculatorHome extends StatefulWidget {
// // //   @override
// // //   _CalculatorHomeState createState() => _CalculatorHomeState();
// // // }
// // //
// // // class _CalculatorHomeState extends State<CalculatorHome> {
// // //   String _display = "0"; // To show the full expression
// // //   String _currentInput = "0";
// // //   double _firstOperand = 0;
// // //   String _operator = "";
// // //   bool _operatorPressed = false;
// // //
// // //   void _onButtonPressed(String buttonText) {
// // //     setState(() {
// // //       if (buttonText == "C") {
// // //         _clear();
// // //       } else if (buttonText == "⌫") {
// // //         _delete();
// // //       } else if (buttonText == "%") {
// // //         _calculatePercentage();
// // //       } else if (["+", "-", "×", "÷"].contains(buttonText)) {
// // //         _setOperator(buttonText);
// // //       } else if (buttonText == "=") {
// // //         _calculateResult();
// // //       } else if (buttonText == ".") {
// // //         _addDecimal();
// // //       } else {
// // //         _appendNumber(buttonText);
// // //       }
// // //     });
// // //   }
// // //
// // //   void _clear() {
// // //     _display = "0";
// // //     _currentInput = "0";
// // //     _firstOperand = 0;
// // //     _operator = "";
// // //     _operatorPressed = false;
// // //   }
// // //
// // //   void _delete() {
// // //     if (_currentInput.length > 1) {
// // //       _currentInput = _currentInput.substring(0, _currentInput.length - 1);
// // //     } else {
// // //       _currentInput = "0";
// // //     }
// // //     _updateDisplay();
// // //   }
// // //
// // //   void _setOperator(String operator) {
// // //     if (_currentInput != "0" && !_operatorPressed) {
// // //       // Update the first operand only if it's a valid number
// // //       _firstOperand = double.parse(_currentInput);
// // //       _operator = operator;
// // //       _operatorPressed = true;
// // //       // Append the operator to the display with the current input
// // //       _display += " $operator ";
// // //       _currentInput = "0"; // Reset current input for the next number
// // //     }
// // //   }
// // //
// // //   void _calculateResult() {
// // //     if (_operator.isNotEmpty && _currentInput != "0") {
// // //       double secondOperand = double.parse(_currentInput);
// // //       double result = 0;
// // //
// // //       switch (_operator) {
// // //         case "+":
// // //           result = _firstOperand + secondOperand;
// // //           break;
// // //         case "-":
// // //           result = _firstOperand - secondOperand;
// // //           break;
// // //         case "×":
// // //           result = _firstOperand * secondOperand;
// // //           break;
// // //         case "÷":
// // //           result = secondOperand != 0 ? _firstOperand / secondOperand : 0;
// // //           break;
// // //       }
// // //
// // //       // Format the result to show only six digits after the decimal point
// // //       _display = result.toStringAsFixed(6);
// // //       _currentInput = _display; // Update current input to the formatted result
// // //       _operator = "";
// // //       _operatorPressed = false;
// // //     }
// // //   }
// // //
// // //   void _calculatePercentage() {
// // //     // If there's an operator set, calculate the percentage of the first operand
// // //     if (_firstOperand != 0 && _operator.isNotEmpty) {
// // //       double percentage = (_firstOperand * (double.parse(_currentInput) / 100));
// // //       _display = percentage.toStringAsFixed(6);
// // //       _currentInput = _display; // Update current input to the percentage result
// // //     } else {
// // //       // Otherwise, calculate the percentage of the current input
// // //       double value = double.parse(_currentInput);
// // //       double percentage = value / 100;
// // //       _display = percentage.toStringAsFixed(6);
// // //       _currentInput = _display; // Update current input to the percentage result
// // //     }
// // //   }
// // //
// // //   // void _calculatePercentage() {
// // //   //   if (_currentInput != "0") {
// // //   //     double value = double.parse(_currentInput);
// // //   //     double percentage = value / 100;
// // //   //     _display = percentage.toStringAsFixed(6);
// // //   //     _currentInput = _display; // Update current input to the percentage result
// // //   //     _operator = "";
// // //   //     _operatorPressed = false;
// // //   //   }
// // //   // }
// // //
// // //   void _addDecimal() {
// // //     if (!_currentInput.contains(".")) {
// // //       _currentInput += ".";
// // //       _updateDisplay();
// // //     }
// // //   }
// // //
// // //   void _appendNumber(String number) {
// // //     if (_currentInput == "0" || _operatorPressed) {
// // //       _currentInput = number; // Start a new number
// // //       _operatorPressed = false; // Reset operator pressed state
// // //     } else {
// // //       _currentInput += number; // Append to the existing number
// // //     }
// // //     _updateDisplay();
// // //   }
// // //
// // //   void _updateDisplay() {
// // //     if (_operator.isNotEmpty) {
// // //       _display = '$_firstOperand $_operator $_currentInput'; // Show expression
// // //     } else {
// // //       _display = _currentInput; // Show current input if no operator
// // //     }
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       backgroundColor: Colors.black,
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           mainAxisAlignment: MainAxisAlignment.end,
// // //           children: <Widget>[
// // //             Align(
// // //               alignment: Alignment.centerRight,
// // //               child: Text(
// // //                 _display,
// // //                 style: TextStyle(fontSize: 48.0, color: Colors.white),
// // //               ),
// // //             ),
// // //             SizedBox(height: 20),
// // //             _buildButtonGrid(),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildButtonGrid() {
// // //     return Column(
// // //       children: [
// // //         _buildButtonRow(["C", "⌫", "÷", "%"]), // Added % button
// // //         _buildButtonRow(["7", "8", "9", "×"]),
// // //         _buildButtonRow(["4", "5", "6", "-"]),
// // //         _buildButtonRow(["1", "2", "3", "+"]),
// // //         _buildButtonRow(["00", "0", ".", "="]), // Added 00 button
// // //       ],
// // //     );
// // //   }
// // //
// // //   Widget _buildButtonRow(List<String> buttons) {
// // //     return Row(
// // //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //       children: buttons.map((buttonText) {
// // //         return _buildButton(buttonText);
// // //       }).toList(),
// // //     );
// // //   }
// // //
// // //   Widget _buildButton(String buttonText) {
// // //     Color buttonColor = _getButtonColor(buttonText);
// // //
// // //     return Padding(
// // //       padding: EdgeInsets.all(8.0),
// // //       child: ElevatedButton(
// // //         onPressed: () => _onButtonPressed(buttonText),
// // //         style: ElevatedButton.styleFrom(
// // //           backgroundColor: buttonColor,
// // //           shape: CircleBorder(),
// // //           padding: EdgeInsets.all(20.0),
// // //           minimumSize: Size(70, 70),
// // //         ),
// // //         child: Text(
// // //           buttonText,
// // //           style: TextStyle(fontSize: 24, color: Colors.white),
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Color _getButtonColor(String buttonText) {
// // //     if (buttonText == "C" || buttonText == "⌫") {
// // //       return Colors.redAccent;
// // //     } else if (["+", "-", "×", "÷", "=", "%"].contains(buttonText)) {
// // //       return Colors.blueAccent;
// // //     } else {
// // //       return Colors.grey[800]!;
// // //     }
// // //   }
// // // }
// //
// // import 'package:flutter/material.dart';
// //
// // class CalculatorApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //         brightness: Brightness.dark,
// //       ),
// //       home: CalculatorHome(),
// //     );
// //   }
// // }
// //
// // class CalculatorHome extends StatefulWidget {
// //   @override
// //   _CalculatorHomeState createState() => _CalculatorHomeState();
// // }
// //
// // class _CalculatorHomeState extends State<CalculatorHome> {
// //   String _display = "0"; // To show the full expression
// //   String _currentInput = "0";
// //   double _firstOperand = 0;
// //   String _operator = "";
// //   bool _operatorPressed = false;
// //
// //   void _onButtonPressed(String buttonText) {
// //     setState(() {
// //       if (buttonText == "C") {
// //         _clear();
// //       } else if (buttonText == "⌫") {
// //         _delete();
// //       } else if (buttonText == "%") {
// //         _calculatePercentage();
// //       } else if (["+", "-", "×", "÷"].contains(buttonText)) {
// //         _setOperator(buttonText);
// //       } else if (buttonText == "=") {
// //         _calculateResult();
// //       } else if (buttonText == ".") {
// //         _addDecimal();
// //       } else {
// //         _appendNumber(buttonText);
// //       }
// //     });
// //   }
// //
// //   void _clear() {
// //     _display = "0";
// //     _currentInput = "0";
// //     _firstOperand = 0;
// //     _operator = "";
// //     _operatorPressed = false;
// //   }
// //
// //   void _delete() {
// //     if (_currentInput.length > 1) {
// //       _currentInput = _currentInput.substring(0, _currentInput.length - 1);
// //     } else {
// //       _currentInput = "0";
// //     }
// //     _updateDisplay();
// //   }
// //
// //   void _setOperator(String operator) {
// //     if (_currentInput != "0" && !_operatorPressed) {
// //       // Update the first operand only if it's a valid number
// //       _firstOperand = double.parse(_currentInput);
// //       _operator = operator;
// //       _operatorPressed = true;
// //       // Append the operator to the display with the current input
// //       _display += " $operator ";
// //       _currentInput = "0"; // Reset current input for the next number
// //     }
// //   }
// //
// //   void _calculateResult() {
// //     if (_operator.isNotEmpty && _currentInput != "0") {
// //       double secondOperand = double.parse(_currentInput);
// //       double result = 0;
// //
// //       switch (_operator) {
// //         case "+":
// //           result = _firstOperand + secondOperand;
// //           break;
// //         case "-":
// //           result = _firstOperand - secondOperand;
// //           break;
// //         case "×":
// //           result = _firstOperand * secondOperand;
// //           break;
// //         case "÷":
// //           result = secondOperand != 0 ? _firstOperand / secondOperand : 0;
// //           break;
// //       }
// //
// //       // Format the result to show only six digits after the decimal point
// //       _display = result.toStringAsFixed(6);
// //       _currentInput = _display; // Update current input to the formatted result
// //       _operator = "";
// //       _operatorPressed = false;
// //     }
// //   }
// //
// //   void _calculatePercentage() {
// //     // If there's an operator set, calculate the percentage of the first operand
// //     if (_firstOperand != 0 && _operator.isNotEmpty) {
// //       double percentage = (_firstOperand * (double.parse(_currentInput) / 100));
// //       _display = percentage.toStringAsFixed(6);
// //       _currentInput = _display; // Update current input to the percentage result
// //     } else {
// //       // Otherwise, calculate the percentage of the current input
// //       double value = double.parse(_currentInput);
// //       double percentage = value / 100;
// //       _display = percentage.toStringAsFixed(6);
// //       _currentInput = _display; // Update current input to the percentage result
// //     }
// //   }
// //
// //   void _addDecimal() {
// //     if (!_currentInput.contains(".")) {
// //       _currentInput += ".";
// //       _updateDisplay();
// //     }
// //   }
// //
// //   void _appendNumber(String number) {
// //     if (_currentInput == "0" || _operatorPressed) {
// //       _currentInput = number; // Start a new number
// //       _operatorPressed = false; // Reset operator pressed state
// //     } else {
// //       _currentInput += number; // Append to the existing number
// //     }
// //     _updateDisplay();
// //   }
// //
// //   void _updateDisplay() {
// //     if (_operator.isNotEmpty) {
// //       _display = '$_firstOperand $_operator $_currentInput'; // Show expression
// //     } else {
// //       _display = _currentInput; // Show current input if no operator
// //     }
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.black,
// //       body: Padding(
// //         padding: const EdgeInsets.all(16.0),
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.end,
// //           children: <Widget>[
// //             Align(
// //               alignment: Alignment.centerRight,
// //               child: Text(
// //                 _display,
// //                 style: TextStyle(fontSize: 48.0, color: Colors.white),
// //               ),
// //             ),
// //             SizedBox(height: 20),
// //             _buildButtonGrid(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildButtonGrid() {
// //     return Column(
// //       children: [
// //         _buildButtonRow(["C", "⌫", "÷", "%"]), // Added % button
// //         _buildButtonRow(["7", "8", "9", "×"]),
// //         _buildButtonRow(["4", "5", "6", "-"]),
// //         _buildButtonRow(["1", "2", "3", "+"]),
// //         _buildButtonRow(["00", "0", ".", "="]), // Added 00 button
// //       ],
// //     );
// //   }
// //
// //   Widget _buildButtonRow(List<String> buttons) {
// //     return Row(
// //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //       children: buttons.map((buttonText) {
// //         return _buildButton(buttonText);
// //       }).toList(),
// //     );
// //   }
// //
// //   Widget _buildButton(String buttonText) {
// //     Color buttonColor = _getButtonColor(buttonText);
// //
// //     return Padding(
// //       padding: EdgeInsets.all(8.0),
// //       child: ElevatedButton(
// //         onPressed: () => _onButtonPressed(buttonText),
// //         style: ElevatedButton.styleFrom(
// //           backgroundColor: buttonColor,
// //           shape: CircleBorder(),
// //           padding: EdgeInsets.all(20.0),
// //           minimumSize: Size(70, 70),
// //         ),
// //         child: Text(
// //           buttonText,
// //           style: TextStyle(fontSize: 24, color: Colors.white),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Color _getButtonColor(String buttonText) {
// //     if (buttonText == "C" || buttonText == "⌫") {
// //       return Colors.redAccent;
// //     } else if (["+", "-", "×", "÷", "=", "%"].contains(buttonText)) {
// //       return Colors.blueAccent;
// //     } else {
// //       return Colors.grey[800]!;
// //     }
// //   }
// // }
//
// import 'package:flutter/material.dart';
//
// class CalculatorApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//         brightness: Brightness.dark,
//       ),
//       home: CalculatorHome(),
//     );
//   }
// }
//
// class CalculatorHome extends StatefulWidget {
//   @override
//   _CalculatorHomeState createState() => _CalculatorHomeState();
// }
//
// class _CalculatorHomeState extends State<CalculatorHome> {
//   String _display = "0"; // To show the full expression
//   String _currentInput = "0";
//   double _firstOperand = 0;
//   String _operator = "";
//   bool _operatorPressed = false;
//
//   void _onButtonPressed(String buttonText) {
//     setState(() {
//       if (buttonText == "C") {
//         _clear();
//       } else if (buttonText == "⌫") {
//         _delete();
//       } else if (buttonText == "%") {
//         _calculatePercentage();
//       } else if (["+", "-", "×", "÷"].contains(buttonText)) {
//         _setOperator(buttonText);
//       } else if (buttonText == "=") {
//         _calculateResult();
//       } else if (buttonText == ".") {
//         _addDecimal();
//       } else {
//         _appendNumber(buttonText);
//       }
//     });
//   }
//
//   void _clear() {
//     _display = "0";
//     _currentInput = "0";
//     _firstOperand = 0;
//     _operator = "";
//     _operatorPressed = false;
//   }
//
//   void _delete() {
//     if (_currentInput.length > 1) {
//       _currentInput = _currentInput.substring(0, _currentInput.length - 1);
//     } else {
//       _currentInput = "0";
//     }
//     _updateDisplay();
//   }
//
//   void _setOperator(String operator) {
//     if (_currentInput != "0" && !_operatorPressed) {
//       // Update the first operand only if it's a valid number
//       _firstOperand = double.parse(_currentInput);
//       _operator = operator;
//       _operatorPressed = true;
//       // Append the operator to the display with the current input
//       _display += " $operator ";
//       _currentInput = "0"; // Reset current input for the next number
//     }
//   }
//
//   void _calculateResult() {
//     if (_operator.isNotEmpty && _currentInput != "0") {
//       double secondOperand = double.parse(_currentInput);
//       double result = 0;
//
//       switch (_operator) {
//         case "+":
//           result = _firstOperand + secondOperand;
//           break;
//         case "-":
//           result = _firstOperand - secondOperand;
//           break;
//         case "×":
//           result = _firstOperand * secondOperand;
//           break;
//         case "÷":
//           result = secondOperand != 0 ? _firstOperand / secondOperand : 0;
//           break;
//       }
//
//       // Format the result to show only six digits after the decimal point
//       _display = result.toStringAsFixed(6);
//       _currentInput = _display; // Update current input to the formatted result
//       _operator = "";
//       _operatorPressed = false;
//     }
//   }
//
//   void _calculatePercentage() {
//     if (_currentInput != "0") {
//       double value = double.parse(_currentInput);
//       double percentage = value / 100;
//
//       // Update display to show the percentage format
//       _display = "${value.toString()}%"; // Display the percentage (e.g., "78%")
//       _currentInput = percentage
//           .toStringAsFixed(6); // Set current input to decimal (e.g., ".78")
//     }
//   }
//
//   void _addDecimal() {
//     if (!_currentInput.contains(".")) {
//       _currentInput += ".";
//       _updateDisplay();
//     }
//   }
//
//   void _appendNumber(String number) {
//     if (_currentInput == "0" || _operatorPressed) {
//       _currentInput = number; // Start a new number
//       _operatorPressed = false; // Reset operator pressed state
//     } else {
//       _currentInput += number; // Append to the existing number
//     }
//     _updateDisplay();
//   }
//
//   void _updateDisplay() {
//     if (_operator.isNotEmpty) {
//       _display = '$_firstOperand $_operator $_currentInput'; // Show expression
//     } else {
//       _display = _currentInput; // Show current input if no operator
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: <Widget>[
//             Align(
//               alignment: Alignment.centerRight,
//               child: Text(
//                 _display,
//                 style: TextStyle(fontSize: 48.0, color: Colors.white),
//               ),
//             ),
//             SizedBox(height: 20),
//             _buildButtonGrid(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildButtonGrid() {
//     return Column(
//       children: [
//         _buildButtonRow(["C", "⌫", "÷", "%"]), // Added % button
//         _buildButtonRow(["7", "8", "9", "×"]),
//         _buildButtonRow(["4", "5", "6", "-"]),
//         _buildButtonRow(["1", "2", "3", "+"]),
//         _buildButtonRow(["00", "0", ".", "="]), // Added 00 button
//       ],
//     );
//   }
//
//   Widget _buildButtonRow(List<String> buttons) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: buttons.map((buttonText) {
//         return _buildButton(buttonText);
//       }).toList(),
//     );
//   }
//
//   Widget _buildButton(String buttonText) {
//     Color buttonColor = _getButtonColor(buttonText);
//
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: ElevatedButton(
//         onPressed: () => _onButtonPressed(buttonText),
//         style: ElevatedButton.styleFrom(
//           backgroundColor: buttonColor,
//           shape: CircleBorder(),
//           padding: EdgeInsets.all(20.0),
//           minimumSize: Size(70, 70),
//         ),
//         child: Text(
//           buttonText,
//           style: TextStyle(fontSize: 24, color: Colors.white),
//         ),
//       ),
//     );
//   }
//
//   Color _getButtonColor(String buttonText) {
//     if (buttonText == "C" || buttonText == "⌫") {
//       return Colors.redAccent;
//     } else if (["+", "-", "×", "÷", "=", "%"].contains(buttonText)) {
//       return Colors.blueAccent;
//     } else {
//       return Colors.grey[800]!;
//     }
//   }
// }

import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

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
  const CalculatorHome({super.key});

  @override
  CalculatorHomeState createState() => CalculatorHomeState();
}

class CalculatorHomeState extends State<CalculatorHome> {
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
      } else if (buttonText == "%") {
        _calculatePercentage();
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
      if (result % 1 == 0) {
        _display = result.toStringAsFixed(0); // No decimal if whole number
      } else {
        _display = result.toStringAsFixed(1); // Up to 3 decimals if needed
      }
      // _display = result.toStringAsFixed(3);
      _currentInput = _display; // Update current input to the formatted result
      _operator = "";
      _operatorPressed = false;
    }
  }

  void _calculatePercentage() {
    if (_currentInput != "0") {
      double value = double.parse(_currentInput);
      double percentage = value / 100; // Divide by 100

      // Update display to show the decimal value (e.g., ".78")
      if (percentage % 1 == 0) {
        _display = percentage.toStringAsFixed(0); // No decimal if whole number
      } else {
        _display = percentage.toStringAsFixed(1); // Up to 3 decimals if needed
      }
      _currentInput =
          percentage.toString(); // Update current input to the decimal result
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
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                _display,
                style: TextStyle(fontSize: 40, color: Colors.white),
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
        _buildButtonRow(["C", "⌫", "÷", "%"]), // Added % button
        _buildButtonRow(["7", "8", "9", "×"]),
        _buildButtonRow(["4", "5", "6", "-"]),
        _buildButtonRow(["1", "2", "3", "+"]),
        _buildButtonRow(["00", "0", ".", "="]), // Added 00 button
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
    } else if (["+", "-", "×", "÷", "=", "%"].contains(buttonText)) {
      return Colors.blueAccent;
    } else {
      return Colors.grey[800]!;
    }
  }
}
