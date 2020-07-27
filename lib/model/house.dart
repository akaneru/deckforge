import 'package:deckforge/static/houses.dart';

class House {
  String id;
  String name;
  String image;
  Houses code;

  House({this.id, this.name, this.image});

  House.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];

    switch (id) {
      case 'Dis':
        code = Houses.dis;
        break;
      case 'Brobnar':
        code = Houses.brobnar;
        break;
      case 'Shadows':
        code = Houses.shadows;
        break;
      case 'Sanctum':
        code = Houses.sanctum;
        break;
      case 'Saurians':
        code = Houses.saurians;
        break;
      case 'Untamned':
        code = Houses.untamned;
        break;
      case 'Mars':
        code = Houses.mars;
        break;
      case 'Star Alliance':
        code = Houses.starAlliance;
        break;
      case 'Logos':
        code = Houses.logos;
        break;
    }
  }
}
