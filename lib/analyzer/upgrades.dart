import 'package:deckforge/analyzer/analyzer.dart';
import 'package:deckforge/model/stat.dart';
import 'package:deckforge/model/deck.dart';
import 'package:deckforge/static/stats_keys.dart';
import 'package:deckforge/static/cards_types.dart';

class Upgrades extends Analyzer {
  @override
  Stat parse(Deck deck) {
    Stat stat = Stat(
        key: StatsKeys.upgrades,
        name: 'Upgrades number',
        description: 'Total numbers of upgrades',
        valueInt: 0,
        valueString: '');
    for (var card in deck.cards) {

      if (card.cardType == CardsTypes.upgrade){
        stat.valueInt++;
      }
    }
    stat.valueString = stat.valueInt.toString();
    return stat;
  }
}
