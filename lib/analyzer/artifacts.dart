import 'package:deckforge/analyzer/analyzer.dart';
import 'package:deckforge/model/stat.dart';
import 'package:deckforge/model/deck.dart';
import 'package:deckforge/static/stats_keys.dart';
import 'package:deckforge/static/cards_types.dart';

class Artifacts extends Analyzer {
  @override
  Stat parse(Deck deck) {
    Stat stat = Stat(
        key: StatsKeys.artifacts,
        name: 'Artifacts number',
        description: 'Total numbers of artifacts',
        valueInt: 0,
        valueString: '');
    for (var card in deck.cards) {
      if (card.cardType == CardsTypes.artifact) {
        stat.valueInt++;
      }
    }
    stat.valueString = stat.valueInt.toString();
    return stat;
  }
}
