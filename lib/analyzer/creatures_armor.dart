import 'package:deckforge/analyzer/analyzer.dart';
import 'package:deckforge/model/stat.dart';
import 'package:deckforge/model/deck.dart';
import 'package:deckforge/static/stats_keys.dart';
import 'package:deckforge/static/cards_types.dart';

class CreaturesArmor extends Analyzer {
  @override
  Stat parse(Deck deck) {
    Stat stat = Stat(
        key: StatsKeys.creaturesArmor,
        name: 'Creatures armor',
        description: 'Total armor of creatures',
        valueInt: 0,
        valueString: '');
    for (var card in deck.cards) {
      if (card.cardType == CardsTypes.creature) {
        stat.valueInt += card.armor;
      }
    }
    stat.valueString = stat.valueInt.toString();
    return stat;
  }
}
