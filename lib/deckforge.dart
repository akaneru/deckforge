import 'package:args/command_runner.dart';
import 'package:deckforge/commands/stats.dart';

void main(List<String> arguments) async {
  final commandRunner = CommandRunner('deckforge', 'keyforge CLI utility');
  commandRunner.addCommand(StatsCommand());
  commandRunner.run(arguments);
}
