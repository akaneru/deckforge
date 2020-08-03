import 'dart:io';
import 'package:dio/dio.dart';
import 'package:deckforge/configs.dart';

class DeckFetcher {
  DeckFetcher() {}

  Future<String> download(String deckId) async {
    // deck endpoint
    String deckEndPoint = Configs.apiEndPoint.replaceFirst('%s', deckId);

    // deck json string
    String deckJson;

    try {
      // caching the deck
      Directory cachePath = new Directory(Configs.cachePath);
      File cacheFile = new File(Configs.cachePath + '${deckId}.json');
      bool useCache = await cachePath.exists();

      if (useCache && await cacheFile.exists()) {
        deckJson = await cacheFile.readAsString();
      } else {
        Response response = await Dio().get(deckEndPoint);
        await cacheFile.writeAsString(response.toString());
        deckJson = response.toString();
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return deckJson;
  }
}
