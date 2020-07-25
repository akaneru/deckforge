import 'package:deckforge/model/stat.dart';
import 'package:deckforge/model/card.dart';

class Characteristic {
  void addCardToStat(Stat stat, Card card) {
    stat.cards.add(card);
  }
}
