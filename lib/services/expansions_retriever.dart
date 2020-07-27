import 'package:deckforge/model/expansion.dart';
import 'package:deckforge/static/expansions.dart';

class ExpansionRetriever {
  ExpansionRetriever() {}

  List<Expansion> loadAll() {
    List<Expansion> expansions = [];

    expansions.add(Expansion(
        id: 341,
        name: 'Call of the Archons',
        code: Expansions.calloftheArchons));
    expansions.add(Expansion(
        id: 435, name: 'Age of Ascension', code: Expansions.ageofAscension));
    expansions.add(Expansion(
        id: 452, name: 'Worlds Collide', code: Expansions.worldsCollide));
    expansions.add(Expansion(
        id: 453, name: 'Worlds Collide', code: Expansions.worldsCollide));
    expansions.add(Expansion(
        id: 479, name: 'Mass Mutation', code: Expansions.massMutation));

    return expansions;
  }
}
