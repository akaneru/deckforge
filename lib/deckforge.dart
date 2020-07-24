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

    // deck name
    print(wrapWith(deck.name, [green, styleBold]));

    // analyze and print some stat
    deckAnalyzer.analyze(deck);
    printStat(deck, StatsKeys.amberBonus, [yellow, styleBold]);
    printStat(deck, StatsKeys.creatures, [green, styleBold]);
    printStat(deck, StatsKeys.creaturesPower, [red, styleBold]);
    printStat(deck, StatsKeys.creaturesArmor, [darkGray, styleBold]);
    printStat(deck, StatsKeys.actions, [lightGray, styleBold]);
    printStat(deck, StatsKeys.artifacts, [blue, styleBold]);
    printStat(deck, StatsKeys.upgrades, [lightRed, styleBold]);

    print('');
  } else {
    print('Deck id format not valid, skipping');
  }
}

void printStat (Deck deck, StatsKeys key, Iterable<AnsiCode> styles) {
    Stat stat = deck.getStatByKey(key);
    print(stat.description +
        ' ' +
        wrapWith(stat.valueString, styles));
}