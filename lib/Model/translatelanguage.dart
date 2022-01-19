class Translations {
  static final languages = ["Spanish", "French", "japanese", "Chinese", "Korean"];

  String getLanguageCode(String language) {
    switch (language) {
      case 'Spanish':
        return 'es';
      case 'French':
        return 'fr';
      case 'japanese':
        return 'ja';
      case 'Chinese':
        return 'zh';
      case 'Korean':
        return 'ko';
      default:
        return 'en';
    }
  }
}
