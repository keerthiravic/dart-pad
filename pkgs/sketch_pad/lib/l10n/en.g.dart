// Generated by package:messages_builder

import 'package:messages/messages_json.dart';

class Messages {
  Messages(
    this._fileLoader,
    this.intlObject,
  );

  final Future<String> Function(String id) _fileLoader;

  String _currentLocale = 'en';

  final Map<String, MessageList> _messages = {};

  static const carbs = {
    'en': ('lib/l10n/en.json', '/JmmZcLq'),
    'de': ('lib/l10n/de.json', 'zZF8nm5r')
  };

  IntlObject intlObject;

  String get currentLocale => _currentLocale;

  MessageList get _currentMessages => _messages[currentLocale]!;

  static Iterable<String> get knownLocales => carbs.keys;

  Future<void> loadLocale(String locale) async {
    if (!_messages.containsKey(locale)) {
      final info = carbs[locale];
      final carb = info?.$1;
      if (carb == null) {
        throw ArgumentError('Locale $locale is not in $knownLocales');
      }
      final data = await _fileLoader(carb);
      final messageList = MessageListJson.fromString(data, intlObject);
      if (messageList.preamble.hash != info?.$2) {
        throw ArgumentError('''
              Messages file for locale $locale has different hash "${messageList.preamble.hash}" than generated code "${info?.$2}".''');
      }
      _messages[locale] = messageList;
    }
    _currentLocale = locale;
  }

  void loadAllLocales() {
    for (final locale in knownLocales) {
      loadLocale(locale);
    }
  }

  String channelSelection(String channelName) =>
      _currentMessages.generateStringAtIndex(0, [channelName]);

  String get feedback => _currentMessages.generateStringAtIndex(1, []);

  String get installSdk => _currentMessages.generateStringAtIndex(2, []);

  String get newPad => _currentMessages.generateStringAtIndex(3, []);

  String get privacyNotice => _currentMessages.generateStringAtIndex(4, []);

  String get samples => _currentMessages.generateStringAtIndex(5, []);
}
