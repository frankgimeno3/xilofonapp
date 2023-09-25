import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatefulWidget {
  @override
  _XylophoneAppState createState() => _XylophoneAppState();
}

class _XylophoneAppState extends State<XylophoneApp> {
  final player = AudioPlayer();

  Future<void> playSound(int soundNumber) async {
    final asset = 'assets/sounds/note$soundNumber.wav';

    try {
      await player.setAsset(asset);
      await player.play();
    } catch (e) {
      print('Error playing sound: $e');
    }
  }

  Widget buildKey({required Color color, required int soundNumber}) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
          ),
          onPressed: () {
            playSound(soundNumber);
          },
          child: const SizedBox(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 5.0),
                    child: Text(
                      "Selecciona una tecla para hacer sonar el xilófono",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                buildKey(color: Colors.white, soundNumber: 1),
                buildKey(color: Colors.white, soundNumber: 2),
                buildKey(color: Colors.white, soundNumber: 3),
                buildKey(color: Colors.white, soundNumber: 4),
                buildKey(color: Colors.white, soundNumber: 5),
                buildKey(color: Colors.white, soundNumber: 6),
                buildKey(color: Colors.white, soundNumber: 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}