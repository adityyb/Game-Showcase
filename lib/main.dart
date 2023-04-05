import 'package:flutter/material.dart';
import 'package:game_showcase/data.dart';
import 'package:game_showcase/game.dart';
import 'package:game_showcase/list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String _selectedPublisher = 'All';

  List<String> getPublishers() {
    List<String> publishers = [];
    for (Game game in games) {
      if (!publishers.contains(game.publisher)) {
        publishers.add(game.publisher);
      }
    }
    return publishers;
  }

  void _onPublisherChanged(String? value) {
    setState(() {
      _selectedPublisher = value ?? 'All';
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Showcase',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: const Color(0xFF171A21),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Game Showcase'),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Text('Filter by Publisher: '),
                  const SizedBox(width: 10.0),
                  DropdownButton<String>(
                    value: _selectedPublisher,
                    items: [
                      const DropdownMenuItem<String>(
                        value: 'All',
                        child: Text('All'),
                      ),
                      ...getPublishers().map(
                            (publisher) => DropdownMenuItem<String>(
                          child: Text(publisher),
                          value: publisher,
                        ),
                      ),
                    ],
                    onChanged: _onPublisherChanged,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListScreen(selectedPublisher: _selectedPublisher),
            ),
          ],
        ),
      ),
    );
  }
}
