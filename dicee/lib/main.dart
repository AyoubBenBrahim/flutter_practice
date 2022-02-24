import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.indigo[200],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int letfDiceNumber = 1;
  int rightDiceNumber = 1;

  void diceChanges() {
    setState(() {
      letfDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                diceChanges();
              },
              child: Image.asset('images/dice$letfDiceNumber.png'),
            ),
          ), // both syntaxes correct
          Expanded(
            child: TextButton(
              onPressed: () {
                diceChanges();
              },
              child: Image(
                image: AssetImage('images/dice$rightDiceNumber.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
