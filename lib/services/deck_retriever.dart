import 'dart:io';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:deckforge/configs.dart';
import 'package:deckforge/model/deck.dart';

class DeckRetriever {
  DeckRetriever() {}

  Future<Deck> loadDeck(String deckId) async {
    // deck endpoint
    String deckEndPoint = Configs.apiEndPoint.replaceFirst('%s', deckId);

    // deck model
    Deck deck;

    // deck json string
    var deckJson;

    try {
      // caching the deck
      Directory cachePath = new Directory(Configs.cachePath);
      File cacheFile = new File(Configs.cachePath + '${deckId}.json');
      bool useCache = await cachePath.exists();

      if (useCache && await cacheFile.exists()) {
        String deckJsonString = await cacheFile.readAsString();
        JsonDecoder decoder = JsonDecoder();
        deckJson = decoder.convert(deckJsonString);
      } else {
        Response response = await Dio().get(deckEndPoint);
        // write cache
        await cacheFile.writeAsString(response.toString());
        deckJson = response.data;
      }

      deck = Deck.fromJson(deckJson['data'], deckJson['_linked']['cards'],
          deckJson['_linked']['houses']);
    } on Exception catch (e) {
      print(e.toString());
    }
    return deck;
  }
}
