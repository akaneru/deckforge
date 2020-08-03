import 'package:deckforge/analyzer/analyzer.dart';
import 'package:deckforge/analyzer/characteristic.dart';
import 'package:deckforge/model/stat.dart';
import 'package:deckforge/model/deck.dart';
import 'package:deckforge/static/stats_keys.dart';

class Maveriks extends Characteristic implements Analyzer {
  @override
  Stat parse(Deck deck) {
    Stat stat = Stat(
        key: StatsKeys.maveriks,
        name: 'Maveriks cards number',
        description: 'Number of maveriks cards');
    for (var card in deck.cards) {
      if (card.isMaverick) {
        stat.valueInt++;
        addCardToStat(stat, card);
      }
    }
    stat.valueString = stat.valueInt.toString();
    return stat;
  }
}
