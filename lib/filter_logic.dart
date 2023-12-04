import 'package:game_showcase/game.dart';

class FilterLogic {
  late String _selectedPublisher = 'All';
  late List<Game> games;

  FilterLogic(this.games);

  List<String> getPublishers() {
    List<String> publishers = [];
    for (Game game in games) {
      if (!publishers.contains(game.publisher)) {
        publishers.add(game.publisher);
      }
    }
    return publishers;
  }

  String get selectedPublisher => _selectedPublisher;

  void onPublisherChanged(String? value) {
    _selectedPublisher = value ?? 'All';
  }
}
