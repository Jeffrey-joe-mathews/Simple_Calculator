import 'package:flutter/material.dart';
class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {

  String _ans = "";
   int? _num1;
   int? _num2;
  String _op = "";

  void buttonPressed(String value) {
    setState(() {
      
    if(int.tryParse(value)!=null) {
      if(_op.isEmpty) {
        _num1 = (_num1??0)*10+int.parse(value);
        _ans = _num1.toString();
      }
      else {
        _num2 = (_num2??0)*10+int.parse(value);
        _ans = _num2.toString();
      }
    }
    else if(value=="="){
      switch (_op) {
        case "+":
          _ans = (_num1!+_num2!).toString();
          break;
        case "-":
          _ans = (_num1!-_num2!).toString();
          break;
        case "/":
          _ans = (_num1!/_num2!).toString();
          break;
        case "*":
          _ans = (_num1!*_num2!).toString();
          break;
        case "C":
          _ans = "";
          break;
        default:break;
      }
      _num1 = null;
      _num2 = null;
      _op = '';
    }
    else{
      _op = value;
    }
    });
  }


  ElevatedButton buildButton(String value) {
    return ElevatedButton(
      onPressed:() => buttonPressed(value),
      child: Text(value,style: TextStyle(fontSize: 20),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Calculator"),
      ),
      backgroundColor: Colors.teal[50],
      body: Column(
        children: [
          Container(
            padding:EdgeInsets.all(10),
            child:  
              Text(_ans,style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold
              ),),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ['7', '8', '9', '/'].map((value) {
              return buildButton(value);
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ["4","5","6","*"].map((value) {
              return buildButton(value);
            }).toList()
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ["1","2","3","-"].map((value) {
              return buildButton(value);
            }).toList()
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: ["0","+","="].map((value) {
              return buildButton(value);
            }).toList(),
          )
        ],
      
      ),
    );
  }
  
  
}