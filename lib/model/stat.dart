import 'package:deckforge/static/stats_keys.dart';

class Stat {
  StatsKeys key;
  String name;
  String description;
  String valueString;
  int valueInt;

  Stat(
      {this.key, this.name, this.description, this.valueString, this.valueInt});
}
