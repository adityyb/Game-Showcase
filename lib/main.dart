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
      title: 'Video Game App',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Color(0xFF171A21),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Video Game App'),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Text('Filter by Publisher: '),
                  SizedBox(width: 10.0),
                  DropdownButton<String>(
                    value: _selectedPublisher,
                    items: [
                      DropdownMenuItem<String>(
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
