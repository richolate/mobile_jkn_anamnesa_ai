/// Constants untuk aplikasi Mobile JKN
class AppConstants {
  // App Info
  static const String appName = 'Mobile JKN';
  static const String appVersion = '4.14.0';

  // User Info (Demo)
  static const String userName = 'AZEL';
  static const String userStatus = 'Anggota Keluarga Non Aktif';

  // URLs untuk React Integration
  static const String reactDevUrl = 'http://localhost:3000';
  static const String reactProdUrl = 'https://your-domain.com';

  // Gunakan development atau production
  static const bool isDevelopment = true;

  static String get reactUrl => isDevelopment ? reactDevUrl : reactProdUrl;

  // Timeouts
  static const Duration splashDuration = Duration(seconds: 3);
  static const Duration animationDuration = Duration(milliseconds: 300);

  // Menu IDs untuk identifikasi menu yang gunakan React
  static const String menuTelehealth = 'telehealth';
  static const String menuInfoProgram = 'info_program';
  static const String menuBugar = 'bugar';

  // Shared Preferences Keys
  static const String keyIsFirstTime = 'is_first_time';
  static const String keyUserData = 'user_data';
  static const String keyToken = 'token';
}
