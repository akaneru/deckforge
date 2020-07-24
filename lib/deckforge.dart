import 'package:args/args.dart';
import 'package:io/ansi.dart';
import 'package:deckforge/configs.dart';
import 'package:deckforge/services/deck_retriever.dart';
import 'package:deckforge/services/deck_analyzer.dart';
import 'package:deckforge/model/deck.dart';
import 'package:deckforge/model/stat.dart';
import 'package:deckforge/static/stats_keys.dart';

RegExp guidRegex = RegExp(Configs.guidPattern);
ArgResults argResults;
DeckRetriever deckRetriever = DeckRetriever();
DeckAnalyzer deckAnalyzer = DeckAnalyzer();

void main(List<String> arguments) async {
  final parser = ArgParser()..addFlag('deck', negatable: false, abbr: 'd');

  argResults = parser.parse(arguments);
  List<String> decks = argResults.rest;

  if (decks.length == 0) {
    print(wrapWith('Please specify one or more deck id', [red, styleBold]));
  } else {
    for (String deckId in decks) {
      await parseDeck(deckId);
    }
  }
}

void parseDeck(String deckId) async {
  if (guidRegex.hasMatch(deckId)) {
    // retrieve deck
    Deck deck = await deckRetriever.loadDeck(deckId);

    print(wrapWith(deck.name, [green, styleBold]));

    // analyze it
    deckAnalyzer.analyze(deck);
    // getting some stats
    Stat amberBonus = deck.getStatByKey(StatsKeys.amberBonus);
    print(amberBonus.description +
        ' ' +
        wrapWith(amberBonus.valueString, [yellow, styleBold]));

    Stat creaturesNumber = deck.getStatByKey(StatsKeys.creatures);
    print(creaturesNumber.description +
        ' ' +
        wrapWith(creaturesNumber.valueString, [blue, styleBold]));

    Stat creaturesPower = deck.getStatByKey(StatsKeys.creaturesPower);
    print(creaturesPower.description +
        ' ' +
        wrapWith(creaturesPower.valueString, [red, styleBold]));

    Stat creaturesArmor = deck.getStatByKey(StatsKeys.creaturesArmor);
    print(creaturesArmor.description +
        ' ' +
        wrapWith(creaturesArmor.valueString, [darkGray, styleBold]));

    print('');
  } else {
    print('Deck id format not valid, skipping');
  }
}
