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

  Widget buildKey(
      {required Color color,
      required int soundNumber,
      required double paddingnum}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 5.0, paddingnum, 5.0),
      child: Padding(
        padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
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
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Center(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 5.0),
                    child: Text(
                      "Haz sonar el xilófono",
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        color: Colors.white,
                        fontSize: 30.0,
                       ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                buildKey(color: Colors.brown.shade900, soundNumber: 1, paddingnum: 1.0),
                buildKey(color: Colors.brown.shade800, soundNumber: 2, paddingnum: 16.0),
                buildKey(color: Colors.brown.shade700, soundNumber: 3, paddingnum: 35.0),
                buildKey(color: Colors.brown.shade600, soundNumber: 4, paddingnum: 55.0),
                buildKey(color: Colors.brown, soundNumber: 5, paddingnum: 70.0),
                buildKey(color: Colors.brown.shade400, soundNumber: 6, paddingnum: 90.5),
                buildKey(color: Colors.brown.shade300, soundNumber: 7, paddingnum: 110.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
