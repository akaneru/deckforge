import 'package:deckforge/analyzer/analyzer.dart';
import 'package:deckforge/model/stat.dart';
import 'package:deckforge/model/deck.dart';
import 'package:deckforge/static/stats_keys.dart';
import 'package:deckforge/static/cards_types.dart';

class Actions extends Analyzer {
  @override
  Stat parse(Deck deck) {
    Stat stat = Stat(
        key: StatsKeys.actions,
        name: 'Actions number',
        description: 'Total numbers of actions',
        valueInt: 0,
        valueString: '');
    for (var card in deck.cards) {
      if (card.cardType == CardsTypes.action) {
        stat.valueInt++;
      }
    }
    stat.valueString = stat.valueInt.toString();
    return stat;
  }
}
