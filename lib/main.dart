import 'package:flutter/material.dart';
import 'package:game_showcase/data.dart';
import 'package:game_showcase/list_screen.dart';
import 'package:game_showcase/filter_logic.dart';
import 'package:game_showcase/FilterWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final FilterLogic _filterLogic = FilterLogic(games);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Showcase',
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Game Showcase'),
        ),
        body: Column(
          children: [
            FilterWidget(
              selectedPublisher: _filterLogic.selectedPublisher,
              onPublisherChanged: _filterLogic.onPublisherChanged,
              publisherItems: _filterLogic.getPublishers(),
            ),
            Expanded(
              child: ListScreen(selectedPublisher: _filterLogic.selectedPublisher),
            ),
          ],
        ),
      ),
    );
  }
}
