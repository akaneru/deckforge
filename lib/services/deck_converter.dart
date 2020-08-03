import 'dart:convert';
import 'package:deckforge/model/deck.dart';
import 'package:deckforge/services/expansions_retriever.dart';
import 'package:deckforge/services/deck_fetcher.dart';

class DeckConverter {
  ExpansionRetriever expansionRetriever;
  DeckFetcher deckFetcher;

  DeckConverter() {
    expansionRetriever = ExpansionRetriever();
    deckFetcher = DeckFetcher();
  }

  Future<Deck> loadDeck(String deckId) async {
    // deck model
    Deck deck;

    try {
      String deckJsonString = await deckFetcher.download(deckId);

      JsonDecoder decoder = JsonDecoder();
      var deckJson = decoder.convert(deckJsonString);

      deck = Deck.fromJson(deckJson['data'], deckJson['_linked']['cards'],
          deckJson['_linked']['houses'], expansionRetriever.loadAll());
    } on Exception catch (e) {
      print(e.toString());
    }
    return deck;
  }
}
