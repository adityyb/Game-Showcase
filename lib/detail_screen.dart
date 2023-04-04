import 'package:flutter/material.dart';
import 'package:game_showcase/game.dart';

class DetailScreen extends StatelessWidget {
  final Game game;

  DetailScreen({required this.game});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(game.title),
      ),
      body: Column(
        children: [
          Image.asset(game.imagepath),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(game.description),
          ),
        ],
      ),
    );
  }
}
