import 'package:deckforge/analyzer/analyzer.dart';
import 'package:deckforge/analyzer/characteristic.dart';
import 'package:deckforge/model/stat.dart';
import 'package:deckforge/model/deck.dart';
import 'package:deckforge/static/stats_keys.dart';
import 'package:deckforge/static/cards_rarity.dart';

class RarityUncommon extends Characteristic implements Analyzer {
  @override
  Stat parse(Deck deck) {
    Stat stat = Stat(
        key: StatsKeys.rarityUncommon,
        name: 'Uncommon cards',
        description: 'Number of uncommon cards');
    for (var card in deck.cards) {
      if (card.rarity == CardsRarity.uncommon) {
        stat.valueInt++;
        addCardToStat(stat, card);
      }
    }
    stat.valueString = stat.valueInt.toString();
    return stat;
  }
}
