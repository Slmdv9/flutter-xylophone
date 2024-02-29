import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            XylophoneKey(keyNumber: 1, color: Colors.red),
            XylophoneKey(keyNumber: 2, color: Colors.orange),
            XylophoneKey(keyNumber: 3, color: Colors.yellow),
            XylophoneKey(keyNumber: 4, color: Colors.green),
            XylophoneKey(keyNumber: 5, color: Colors.teal),
            XylophoneKey(keyNumber: 6, color: Colors.blue),
            XylophoneKey(keyNumber: 7, color: Colors.purple)
          ],
        )),
      ),
    );
  }
}

class XylophoneKey extends StatelessWidget {
  const XylophoneKey({super.key, required int keyNumber, required Color color})
      : _keyNumber = keyNumber,
        _color = color;

  final int _keyNumber;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(_color),
        ),
        child: Container(),
        onPressed: () async {
          AudioCache.instance = AudioCache(prefix: '');
          final player = AudioPlayer();
          await player.play(AssetSource('assets/note$_keyNumber.wav'));
        },
      ),
    );
  }
}
