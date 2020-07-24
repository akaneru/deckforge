import 'package:deckforge/model/stat.dart';
import 'package:deckforge/model/deck.dart';

abstract class Analyzer {
  Stat parse(Deck deck);
}
