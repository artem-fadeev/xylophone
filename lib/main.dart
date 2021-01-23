import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  runApp(XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  Container createBlackCircle() {
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.black,
      ),
    );
  }

  Expanded coloredNoisyButton(
      {int soundNumber, Color color, int buttonFlexValue}) {
    return Expanded(
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: buttonFlexValue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlatButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(8.0)),
                height: double.infinity,
                onPressed: () {
                  final player = AudioCache();
                  player.play('note$soundNumber.wav');
                },
                color: color,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    createBlackCircle(),
                    createBlackCircle(),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(),
          ),
        ],
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
            children: <Widget>[
              coloredNoisyButton(
                  color: Colors.red, soundNumber: 1, buttonFlexValue: 14),
              coloredNoisyButton(
                  color: Colors.orange, soundNumber: 2, buttonFlexValue: 13),
              coloredNoisyButton(
                  color: Colors.yellow, soundNumber: 3, buttonFlexValue: 12),
              coloredNoisyButton(
                  color: Colors.green, soundNumber: 4, buttonFlexValue: 10),
              coloredNoisyButton(
                  color: Colors.green.shade900,
                  soundNumber: 5,
                  buttonFlexValue: 9),
              coloredNoisyButton(
                  color: Colors.blue, soundNumber: 6, buttonFlexValue: 8),
              coloredNoisyButton(
                  color: Colors.purple, soundNumber: 7, buttonFlexValue: 7),
            ],
          ),
        ),
      ),
    );
  }
}
