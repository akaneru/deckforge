import 'package:deckforge/analyzer/anomalies.dart';
import 'package:deckforge/analyzer/amber.dart';
import 'package:deckforge/analyzer/actions.dart';
import 'package:deckforge/analyzer/artifacts.dart';
import 'package:deckforge/analyzer/creatures.dart';
import 'package:deckforge/analyzer/creatures_power.dart';
import 'package:deckforge/analyzer/creatures_armor.dart';
import 'package:deckforge/analyzer/maveriks.dart';
import 'package:deckforge/analyzer/rarity_common.dart';
import 'package:deckforge/analyzer/rarity_rare.dart';
import 'package:deckforge/analyzer/rarity_special.dart';
import 'package:deckforge/analyzer/rarity_uncommon.dart';
import 'package:deckforge/analyzer/rarity_variant.dart';
import 'package:deckforge/analyzer/upgrades.dart';
import 'package:deckforge/analyzer/enhancements.dart';
import 'package:deckforge/model/deck.dart';

class DeckAnalyzer {
  DeckAnalyzer() {}

  void analyze(Deck deck) {
    deck.stats.add(Amber().parse(deck));
    deck.stats.add(Creatures().parse(deck));
    deck.stats.add(CreaturesPower().parse(deck));
    deck.stats.add(CreaturesArmor().parse(deck));
    deck.stats.add(Actions().parse(deck));
    deck.stats.add(Artifacts().parse(deck));
    deck.stats.add(Upgrades().parse(deck));
    deck.stats.add(Enhancements().parse(deck));
    deck.stats.add(Anomalies().parse(deck));
    deck.stats.add(Maveriks().parse(deck));
    deck.stats.add(RarityCommon().parse(deck));
    deck.stats.add(RarityUncommon().parse(deck));
    deck.stats.add(RarityRare().parse(deck));
    deck.stats.add(RaritySpecial().parse(deck));
    deck.stats.add(RarityVariant().parse(deck));
  }
}
