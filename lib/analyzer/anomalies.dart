import 'package:deckforge/analyzer/analyzer.dart';
import 'package:deckforge/analyzer/characteristic.dart';
import 'package:deckforge/model/stat.dart';
import 'package:deckforge/model/deck.dart';
import 'package:deckforge/static/stats_keys.dart';

class Anomalies extends Characteristic implements Analyzer {
  @override
  Stat parse(Deck deck) {
    Stat stat = Stat(
        key: StatsKeys.anomalies,
        name: 'Anomalies cards',
        description: 'Number of anomalies cards');
    for (var card in deck.cards) {
      if (card.isAnomaly) {
        stat.valueInt++;
        addCardToStat(stat, card);
      }
    }
    stat.valueString = stat.valueInt.toString();
    return stat;
  }
}
