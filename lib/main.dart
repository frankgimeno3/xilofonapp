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
        padding: EdgeInsets.all(5.0), // Agregar margen de 5 en cada lado del TextButton
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
          ),
          onPressed: () {
            playSound(soundNumber);
          },
          child: const SizedBox(), // Puedes reemplazar esto con el contenido de tu botón
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
            padding: const EdgeInsets.all(30.0), // Agregar margen de 30 en todos los lados
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                buildKey(color: Colors.red, soundNumber: 1),
                buildKey(color: Colors.white, soundNumber: 2),
                buildKey(color: Colors.red, soundNumber: 3),
                buildKey(color: Colors.white, soundNumber: 4),
                buildKey(color: Colors.red, soundNumber: 5),
                buildKey(color: Colors.white, soundNumber: 6),
                buildKey(color: Colors.red, soundNumber: 7),
              ],
            ),
          ),
        ),
      ),
    );
  }
}