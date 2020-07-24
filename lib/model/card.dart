import 'package:deckforge/static/cards_types.dart';
import 'package:deckforge/model/house.dart';

class Card {
  String id;
  String cardTitle;
  String houseName;
  CardsTypes cardType;
  String frontImage;
  String cardText;
  String traits;
  int amber;
  int power;
  int armor;
  String rarity;
  String flavorText;
  String cardNumber;
  int expansion;
  bool isMaverick;
  bool isAnomaly;
  bool isEnhanced;
  House house;

  Card(
      {this.id,
      this.cardTitle,
      this.houseName,
      this.cardType,
      this.frontImage,
      this.cardText,
      this.amber,
      this.power,
      this.armor,
      this.rarity,
      this.flavorText,
      this.cardNumber,
      this.expansion,
      this.isMaverick,
      this.isAnomaly,
      this.isEnhanced});

  Card.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cardTitle = json['card_title'];
    houseName = json['house'];
    frontImage = json['front_image'];
    cardText = json['card_text'];
    traits = json['traits'];
    amber = json['amber'] == null ? 0 : json['amber'];
    power = json['power'] == null ? 0 : int.parse(json['power']);
    armor = json['armor'] == null ? 0 : int.parse(json['armor']);
    rarity = json['rarity'];
    flavorText = json['flavor_text'];
    cardNumber = json['card_number'];
    expansion = json['expansion'];
    isMaverick = json['is_maverick'];
    isAnomaly = json['is_anomaly'];
    isEnhanced = json['is_enhanced'];

    switch (json['card_type']) {
      case 'Creature':
        cardType = CardsTypes.creature;
        break;
      case 'Updrade':
        cardType = CardsTypes.upgrade;
        break;
      case 'Action':
        cardType = CardsTypes.action;
        break;
      case 'Artifact':
        cardType = CardsTypes.artifact;
        break;
    }
  }
}