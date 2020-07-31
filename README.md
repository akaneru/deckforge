
# deckforge

CLI utility that retrieve [KeyForge](https://keyforgegame.com) deck's data from official (undocumented) API and print some stat.

Both features can be also used from thirdy part Dart code.

## Requirements

- [Dart sdk](https://dart.dev/get-dart)

## CLI usage

`$ dart lib/deckforge.dart <command> [arguments]`

### CLI example

`$ dart lib/deckforge.dart stats --deck 56c0328f-6ffa-49f4-9449-641f346c9a33 --deck cdbfba62-e077-4a43-b91b-4724cf2bb4c8 --deck d012ed28-d9dc-4d56-be80-faa0351b731f --deck 6cffebc8-8922-49ad-b26b-3b076830e7ee --deck de7fcdb7-1f90-474a-a02d-e94398c95a4a --deck 41bdbe4a-d6de-4e3d-b726-3131dabe7cd1 --deck 5d44b11f-0eae-403e-ae18-952f34fcc40e --deck   e2bd9cac-2274-4a3e-9bf3-d656ac2c4d9f --deck f2572901-8fd9-46f5-917d-48f409d8ec16`

### Output (for one card)

![Output example](https://user-images.githubusercontent.com/18366032/88548095-e783eb00-d01e-11ea-9234-9bada4dc17e8.png)

## Usage from other Dart code

```dart

import 'package:deckforge/services/deck_retriever.dart';
import 'package:deckforge/services/deck_analyzer.dart';

...
  
  String deckId = '56c0328f-6ffa-49f4-9449-641f346c9a33';
  DeckRetriever deckRetriever = DeckRetriever();
  DeckAnalyzer deckAnalyzer = DeckAnalyzer();

  Deck deck = await deckRetriever.loadDeck(deckId);
  deckAnalyzer.analyze(deck);

  // to something with deck object and deck.stats data
  // ...

...

```

## Todo

- finish all analyzer for stats
- other features (work in progress)