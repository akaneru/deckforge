import 'package:deckforge/model/card.dart';
import 'package:deckforge/model/house.dart';
import 'package:deckforge/model/stat.dart';
import 'package:deckforge/static/stats_keys.dart';

class Deck {
  String id;
  String name;
  int expansionNumber;
  int powerLevel;
  int chains;
  int wins;
  int losses;
  List<Card> cards = List();
  List<String> cardIds = List();
  List<House> houses = List();
  List<Stat> stats = List();

  Deck(
      {this.id,
      this.name,
      this.expansionNumber,
      this.powerLevel,
      this.chains,
      this.wins,
      this.losses,
      this.cards});

  Deck.fromJson(Map<String, dynamic> json, List<dynamic> cardList,
      List<dynamic> houseList) {
    id = json['id'];
    name = json['name'];
    expansionNumber = json['expansion'];
    powerLevel = json['powerLevel'];
    chains = json['chains'];
    wins = json['wins'];
    losses = json['losses'];

    for (var house in houseList) {
      houses.add(House.fromJson(house));
    }

    for (var cardId in json['_links']['cards']) {
      cardIds.add(cardId);
    }

    for (var card in cardList) {
      int countCards = 0;
      House currentHouse = null;

      // count how many cards in deck
      cardIds.forEach((cardId) => card['id'] == cardId ? countCards++ : null);

      // for each of that card create the card object
      for (var index = 0; index < countCards; index++) {
        Card cardObject = Card.fromJson(card);

        // card's house detection
        if (currentHouse == null) {
          for (var house in houses) {
            if (house.id == cardObject.houseName) {
              currentHouse = house;
              break;
            }
          }
        }

        cardObject.house = currentHouse;
        cards.add(cardObject);
      }
    }
  }

  Stat getStatByKey(StatsKeys key) {
    Stat found = null;
    for (Stat stat in this.stats) {
      if (stat.key == key) {
        found = stat;
        break;
      }
    }
    return found;
  }
}
