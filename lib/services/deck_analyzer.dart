import 'package:deckforge/model/deck.dart';
import 'package:deckforge/analyzer/amber.dart';
import 'package:deckforge/analyzer/creatures.dart';
import 'package:deckforge/analyzer/creatures_power.dart';
import 'package:deckforge/analyzer/creatures_armor.dart';

class DeckAnalyzer {
  DeckAnalyzer() {}

  void analyze(Deck deck) {
    deck.stats.add(Amber().parse(deck));
    deck.stats.add(Creatures().parse(deck));
    deck.stats.add(CreaturesPower().parse(deck));
    deck.stats.add(CreaturesArmor().parse(deck));
  }
}
