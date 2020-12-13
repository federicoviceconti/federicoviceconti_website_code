import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class FirebaseAnalyticsHelper {
  static const EASTER_EGG_FOUND = 'easter_egg_found';
  static const MAIL_HOME_TAP = 'contact_mail_home_tap';

  static final FirebaseAnalyticsHelper _singleton =
      FirebaseAnalyticsHelper._internal();

  static final FirebaseAnalytics _analytics = FirebaseAnalytics();

  static final FirebaseAnalyticsObserver _observer = FirebaseAnalyticsObserver(
    analytics: _analytics,
  );

  FirebaseAnalyticsHelper._internal();

  factory FirebaseAnalyticsHelper() {
    return _singleton;
  }

  FirebaseAnalyticsObserver get observer => _observer;

  FirebaseAnalytics get analytics => _analytics;

  Future<void> initialize() async {
    await Firebase.initializeApp();
  }
}