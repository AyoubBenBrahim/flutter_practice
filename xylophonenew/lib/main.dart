import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioCache();
    player.play('note$soundNumber.wav');
  }

  Expanded buildKey({required Color myColor, required int soundNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
            // primary: myColor, // foreground
            backgroundColor: myColor),
        onPressed: () {
          playSound(soundNumber);
        },
        child: Text(
          '',
          // style: TextStyle(color: myColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildKey(myColor: Colors.red, soundNumber: 1),
              buildKey(myColor: Colors.orange, soundNumber: 2),
              buildKey(myColor: Colors.yellow, soundNumber: 3),
              buildKey(myColor: Colors.green, soundNumber: 4),
              buildKey(myColor: Colors.teal, soundNumber: 5),
              buildKey(myColor: Colors.blue, soundNumber: 6),
              buildKey(myColor: Colors.purple, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
