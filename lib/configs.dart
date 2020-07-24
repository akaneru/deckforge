class Configs {
  static const String guidPattern =
      r'[a-z0-9]{8}\-[a-z0-9]{4}\-[a-z0-9]{4}\-[a-z0-9]{4}\-[a-z0-9]{12}';
  static const String apiEndPoint =
      'https://www.keyforgegame.com/api/decks/%s/?links=cards';
  static const String cachePath = '/tmp/';
}
