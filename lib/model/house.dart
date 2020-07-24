import 'package:deckforge/static/houses.dart';

class House {
  String id;
  String name;
  String image;
  dynamic house;

  House({this.id, this.name, this.image});

  House.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];

    switch (id) {
      case 'Dis':
        house = Houses.dis;
        break;
      case 'Brobnar':
        house = Houses.brobnar;
        break;
      case 'Shadows':
        house = Houses.shadows;
        break;
      case 'Sanctum':
        house = Houses.sanctum;
        break;
      case 'Saurians':
        house = Houses.saurians;
        break;
      case 'Untamned':
        house = Houses.untamned;
        break;
      case 'Mars':
        house = Houses.mars;
        break;
      case 'Star Alliance':
        house = Houses.starAlliance;
        break;
      case 'Logos':
        house = Houses.logos;
        break;
    }
  }
}
