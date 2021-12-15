class FirebaseAnalyticsHelper {
  static const EASTER_EGG_FOUND = 'easter_egg_found';
  static const MAIL_HOME_TAP = 'contact_mail_home_tap';
  static const GITHUB_CONTACTS = 'github_contacts';
  static const EMAIL_CONTACTS = 'email_contacts';
  static const LINKEDIN_CONTACTS = 'linkedin_contacts';

  static final FirebaseAnalyticsHelper _singleton =
      FirebaseAnalyticsHelper._internal();

  FirebaseAnalyticsHelper._internal();

  factory FirebaseAnalyticsHelper() {
    return _singleton;
  }

  void logAppOpen() {}

  void logEvent({required String name, Map<String, Object?>? parameters}) {}

  Future<void> initialize() async {}

  void setCurrentScreen({required String screenName}) {}
}
