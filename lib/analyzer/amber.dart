import 'package:deckforge/analyzer/analyzer.dart';
import 'package:deckforge/analyzer/characteristic.dart';
import 'package:deckforge/model/stat.dart';
import 'package:deckforge/model/deck.dart';
import 'package:deckforge/static/stats_keys.dart';

class Amber extends Characteristic implements Analyzer {
  @override
  Stat parse(Deck deck) {
    Stat stat = Stat(
        key: StatsKeys.amberBonus,
        name: 'Amber bonus',
        description: 'Total amber bonus');
    for (var card in deck.cards) {
      stat.valueInt += card.amber;
      addCardToStat(stat, card);
    }
    stat.valueString = stat.valueInt.toString();
    return stat;
  }
}
