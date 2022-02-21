
import '../app_consts/app_consts.dart';
import '../app_languages/en.dart';
import '../app_languages/ru.dart';
import 'package:translator/translator.dart';

class AppLanguages {
  //#region Settings
  static GoogleTranslator translator = GoogleTranslator();
  static String defaultLanguage = kRussian;
  static final Map<String, Map<String, String>> _localizedValues = {
    'en': En.en,
    'ru': Ru.ru
  };

  static set language(String lang) {
    defaultLanguage = lang;
  }

  //#endregion

  static Future<String> myTranslator(String text) async {
    switch (defaultLanguage) {
      case kEnglish:
        return text;
      case kRussian:

        Future<Translation> future =
            translator.translate(text, from: kEnglish, to: kRussian);

        Translation translation = await future;

        return translation.text;

      default:
        return text;
    }

    return text;
  }

  /// Languages
  static String get english => _localizedValues[defaultLanguage]!['english']!;

  static String get russian => _localizedValues[defaultLanguage]!['russian']!;

  /// Menu
  static String get byDays => _localizedValues[defaultLanguage]!['byDays']!;

  static String get byHours => _localizedValues[defaultLanguage]!['byHours']!;

  static String get fahrenheit =>
      _localizedValues[defaultLanguage]!['fahrenheit']!;

  static String get wind => _localizedValues[defaultLanguage]!['wind']!;

  static String get humidity => _localizedValues[defaultLanguage]!['humidity']!;

  static String get km => _localizedValues[defaultLanguage]!['km']!;

  static String get mm => _localizedValues[defaultLanguage]!['mm']!;
}
