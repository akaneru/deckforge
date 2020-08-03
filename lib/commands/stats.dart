import 'package:args/command_runner.dart';
import 'package:deckforge/configs.dart';
import 'package:deckforge/model/deck.dart';
import 'package:deckforge/model/stat.dart';
import 'package:deckforge/services/deck_converter.dart';
import 'package:deckforge/services/deck_analyzer.dart';
import 'package:deckforge/static/stats_keys.dart';
import 'package:io/ansi.dart';

class StatsCommand extends Command {
  final name = "stats";
  final description = "Print stats of one or more decks.";
  DeckConverter deck_converter;
  DeckAnalyzer deckAnalyzer;
  RegExp guidRegex;

  StatsCommand() {
    deck_converter = DeckConverter();
    deckAnalyzer = DeckAnalyzer();
    guidRegex = RegExp(Configs.guidPattern);
    argParser.addMultiOption('deck', abbr: 'd');
  }

  void run() async {
    List<String> decks = argResults['deck'];

    if (decks.length == 0) {
      print(wrapWith('Please specify one or more deck id', [red, styleBold]));
    } else {
      for (String deckId in decks) {
        if (guidRegex.hasMatch(deckId)) {
          // retrieve deck
          Deck deck = await deck_converter.loadDeck(deckId);

          // deck name
          print(wrapWith(deck.name, [green, styleBold]) +
              ' from ' +
              wrapWith(deck.expansion.name, [lightGreen]));

          // analyze and print some stat
          deckAnalyzer.analyze(deck);
          printStat(deck, StatsKeys.amberBonus, [yellow, styleBold]);
          printStat(deck, StatsKeys.creatures, [green, styleBold]);
          printStat(deck, StatsKeys.creaturesPower, [red, styleBold]);
          printStat(deck, StatsKeys.creaturesArmor, [darkGray, styleBold]);
          printStat(deck, StatsKeys.actions, [lightGray, styleBold]);
          printStat(deck, StatsKeys.artifacts, [blue, styleBold]);
          printStat(deck, StatsKeys.upgrades, [lightRed, styleBold]);
          printStat(deck, StatsKeys.enhanced, [backgroundWhite, black, styleBold]);          
          printStat(deck, StatsKeys.anomalies, [backgroundGreen, black, styleBold]);

          print('');
        } else {
          print('Deck id format not valid, skipping');
        }
      }
    }
  }

  void printStat(Deck deck, StatsKeys key, Iterable<AnsiCode> styles) {
    Stat stat = deck.getStatByKey(key);
    print(stat.description + ' ' + wrapWith(stat.valueString, styles));
  }
}
