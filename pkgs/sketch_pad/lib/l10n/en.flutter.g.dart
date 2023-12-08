// Generated by package:flutter_messages

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:messages/package_intl_object.dart';

import 'en.g.dart';

class MessagesLocalizations {
  static Iterable<LocalizationsDelegate<dynamic>> localizationsDelegates = [
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static LocalizationsDelegate<Messages> delegate =
      MessagesLocalizationsDelegate();

  static List<Locale> get supportedLocales {
    return Messages.knownLocales.map((e) {
      final split = e.split('_');
      final code = split.length > 1 ? split[1] : null;
      return Locale(split.first, code);
    }).toList();
  }

  static Messages? of(BuildContext context) =>
      Localizations.of<Messages>(context, Messages);
}

class MessagesLocalizationsDelegate extends LocalizationsDelegate<Messages> {
  @override
  bool isSupported(Locale locale) =>
      Messages.knownLocales.contains(locale.toString());

  @override
  Future<Messages> load(Locale locale) async {
    await messages.loadLocale(locale.toString());
    return messages;
  }

  @override
  bool shouldReload(LocalizationsDelegate<Messages> old) => false;
}

Messages messages = Messages(rootBundle.loadString, const OldIntlObject());
