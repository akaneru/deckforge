import 'package:deckforge/analyzer/analyzer.dart';
import 'package:deckforge/model/stat.dart';
import 'package:deckforge/model/deck.dart';
import 'package:deckforge/static/stats_keys.dart';

class Amber extends Analyzer {
  @override
  Stat parse(Deck deck) {
    Stat stat = Stat(
        key: StatsKeys.amberBonus,
        name: 'Amber bonus',
        description: 'Total amber bonus',
        valueInt: 0,
        valueString: '');
    for (var card in deck.cards) {
      stat.valueInt += card.amber;
    }
    stat.valueString = stat.valueInt.toString();
    return stat;
  }
}
