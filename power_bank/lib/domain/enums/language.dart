enum Language {
  russian,
  english,
}

extension LanguageExtension on Language {
  String get name {
    switch (this) {
      case Language.russian:
        return 'ru';
      case Language.english:
        return 'en';
    }
  }
}
