class AppStrings {
  AppStrings._();

  static const localeDisplayNames = {
    'en': 'English',
    'ar': 'العربية',
  };

  static String localeDisplayName(String code) =>
      localeDisplayNames[code] ?? code;
}
