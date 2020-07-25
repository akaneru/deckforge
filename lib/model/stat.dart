import 'package:deckforge/static/stats_keys.dart';
import 'package:deckforge/model/card.dart';

class Stat {
  StatsKeys key;
  String name;
  String description;
  String valueString;
  int valueInt;
  List<Card> cards = [];

  Stat(
      {this.key,
      this.name,
      this.description,
      this.valueString = '',
      this.valueInt = 0});
}
