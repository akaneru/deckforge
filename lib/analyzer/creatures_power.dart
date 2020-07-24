import 'package:deckforge/analyzer/analyzer.dart';
import 'package:deckforge/model/stat.dart';
import 'package:deckforge/model/deck.dart';
import 'package:deckforge/static/stats_keys.dart';
import 'package:deckforge/static/cards_types.dart';

class CreaturesPower extends Analyzer {
  @override
  Stat parse(Deck deck) {
    Stat stat = Stat(
        key: StatsKeys.creaturesPower,
        name: 'Creatures power',
        description: 'Total power of creatures',
        valueInt: 0,
        valueString: '');
    for (var card in deck.cards) {
      if (card.cardType == CardsTypes.creature) {
        stat.valueInt += card.power;
      }
    }
    stat.valueString = stat.valueInt.toString();
    return stat;
  }
}
