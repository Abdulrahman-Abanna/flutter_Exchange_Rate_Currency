class LanguageData {
  final String flag;
  final String name;
  final String languageCode;

  LanguageData(this.flag, this.name, this.languageCode);
  
  static List<LanguageData> LanguageList() {
    return <LanguageData>[
      LanguageData("🇸🇦", "العربية", "ar"),
      LanguageData("🇺🇸", "English", 'en'),
    ];
  }
}
