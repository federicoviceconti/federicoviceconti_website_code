import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_it.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('it')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Federico Viceconti | Flutter Developer'**
  String get appTitle;

  /// No description provided for @navigation.
  ///
  /// In en, this message translates to:
  /// **'Navigation'**
  String get navigation;

  /// No description provided for @navAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get navAbout;

  /// No description provided for @navCurrentWork.
  ///
  /// In en, this message translates to:
  /// **'Current work'**
  String get navCurrentWork;

  /// No description provided for @navProjects.
  ///
  /// In en, this message translates to:
  /// **'Projects'**
  String get navProjects;

  /// No description provided for @navExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get navExperience;

  /// No description provided for @navContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Switch to light mode'**
  String get lightMode;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Switch to dark mode'**
  String get darkMode;

  /// No description provided for @heroEyebrow.
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer'**
  String get heroEyebrow;

  /// No description provided for @heroTitle.
  ///
  /// In en, this message translates to:
  /// **'Hello, I\'m Federico. I build polished mobile and web experiences with Flutter.'**
  String get heroTitle;

  /// No description provided for @heroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Android developer, Flutter enthusiast, and lifelong learner based in Rome. I love combining clean architecture with delightful UX.'**
  String get heroSubtitle;

  /// No description provided for @heroPrimaryCta.
  ///
  /// In en, this message translates to:
  /// **'Explore projects'**
  String get heroPrimaryCta;

  /// No description provided for @heroSecondaryCta.
  ///
  /// In en, this message translates to:
  /// **'Let\'s talk'**
  String get heroSecondaryCta;

  /// No description provided for @heroScrollHint.
  ///
  /// In en, this message translates to:
  /// **'Scroll to discover more'**
  String get heroScrollHint;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About me'**
  String get aboutTitle;

  /// No description provided for @aboutDescription.
  ///
  /// In en, this message translates to:
  /// **'Developer, lifelong learner and music lover. Born in 1997 in southern Italy, now based in Rome. I fell in love with Android development and currently focus on creating lovely and functional apps with Flutter.'**
  String get aboutDescription;

  /// No description provided for @currentWorkTitle.
  ///
  /// In en, this message translates to:
  /// **'What I\'m working on'**
  String get currentWorkTitle;

  /// No description provided for @currentWorkHeading.
  ///
  /// In en, this message translates to:
  /// **'Mobile Developer @ Wind Tre S.p.A.'**
  String get currentWorkHeading;

  /// No description provided for @currentWorkDescription.
  ///
  /// In en, this message translates to:
  /// **'Working in the IT Development team as App Developer. Main technologies: Flutter and Git.'**
  String get currentWorkDescription;

  /// No description provided for @currentWorkTags.
  ///
  /// In en, this message translates to:
  /// **'Flutter,Android,Git,Mobile'**
  String get currentWorkTags;

  /// No description provided for @projectsTitle.
  ///
  /// In en, this message translates to:
  /// **'Selected projects'**
  String get projectsTitle;

  /// No description provided for @projectsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Real side projects I\'ve built and maintained with Flutter and Dart.'**
  String get projectsSubtitle;

  /// No description provided for @projectOneTitle.
  ///
  /// In en, this message translates to:
  /// **'card_stack_widget'**
  String get projectOneTitle;

  /// No description provided for @projectOneDescription.
  ///
  /// In en, this message translates to:
  /// **'A vertical dismissible and customizable stack of cards for Flutter applications.'**
  String get projectOneDescription;

  /// No description provided for @projectTwoTitle.
  ///
  /// In en, this message translates to:
  /// **'unofficial_twitch_open_api'**
  String get projectTwoTitle;

  /// No description provided for @projectTwoDescription.
  ///
  /// In en, this message translates to:
  /// **'Wrapper for the newest Twitch API, available on pub.dev. It exposes channels, media, search, and game data.'**
  String get projectTwoDescription;

  /// No description provided for @projectThreeTitle.
  ///
  /// In en, this message translates to:
  /// **'flutter_slider'**
  String get projectThreeTitle;

  /// No description provided for @projectThreeDescription.
  ///
  /// In en, this message translates to:
  /// **'Creates slides from a JSON file. The presentation adapts to different screen resolutions.'**
  String get projectThreeDescription;

  /// No description provided for @projectFourTitle.
  ///
  /// In en, this message translates to:
  /// **'covid_bot'**
  String get projectFourTitle;

  /// No description provided for @projectFourDescription.
  ///
  /// In en, this message translates to:
  /// **'Telegram bot that fetches free API data to provide the latest COVID-19 updates.'**
  String get projectFourDescription;

  /// No description provided for @projectFiveTitle.
  ///
  /// In en, this message translates to:
  /// **'journey_demo'**
  String get projectFiveTitle;

  /// No description provided for @projectFiveDescription.
  ///
  /// In en, this message translates to:
  /// **'Journey planner prototype using A* algorithm and OpenCharge API data for charging stations.'**
  String get projectFiveDescription;

  /// No description provided for @openProject.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get openProject;

  /// No description provided for @sourceCode.
  ///
  /// In en, this message translates to:
  /// **'Source'**
  String get sourceCode;

  /// No description provided for @experienceTitle.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experienceTitle;

  /// No description provided for @experienceOneRole.
  ///
  /// In en, this message translates to:
  /// **'Mobile Developer · Wind Tre S.p.A.'**
  String get experienceOneRole;

  /// No description provided for @experienceOnePeriod.
  ///
  /// In en, this message translates to:
  /// **'2022 - Present'**
  String get experienceOnePeriod;

  /// No description provided for @experienceOneSummary.
  ///
  /// In en, this message translates to:
  /// **'Delivering production mobile features, collaborating with cross-functional teams, and improving release reliability and UX consistency.'**
  String get experienceOneSummary;

  /// No description provided for @experienceTwoRole.
  ///
  /// In en, this message translates to:
  /// **'Digital Engineer · NTT DATA'**
  String get experienceTwoRole;

  /// No description provided for @experienceTwoPeriod.
  ///
  /// In en, this message translates to:
  /// **'2020 - 2022'**
  String get experienceTwoPeriod;

  /// No description provided for @experienceTwoSummary.
  ///
  /// In en, this message translates to:
  /// **'Development of native and hybrid Android applications (Xamarin, Flutter), along with building and maintaining web portals using React'**
  String get experienceTwoSummary;

  /// No description provided for @experienceThreeRole.
  ///
  /// In en, this message translates to:
  /// **'Software Developer · Vetrya'**
  String get experienceThreeRole;

  /// No description provided for @experienceThreePeriod.
  ///
  /// In en, this message translates to:
  /// **'2018 - 2020'**
  String get experienceThreePeriod;

  /// No description provided for @experienceThreeSummary.
  ///
  /// In en, this message translates to:
  /// **'Built application features across multiple technologies and strengthened full-product delivery skills from design handoff to production.'**
  String get experienceThreeSummary;

  /// No description provided for @contactTitle.
  ///
  /// In en, this message translates to:
  /// **'Let\'s build something meaningful'**
  String get contactTitle;

  /// No description provided for @contactSubtitle.
  ///
  /// In en, this message translates to:
  /// **'If you\'re looking for a developer focused on product quality and execution, feel free to reach out.'**
  String get contactSubtitle;

  /// No description provided for @contactEmail.
  ///
  /// In en, this message translates to:
  /// **'Email me'**
  String get contactEmail;

  /// No description provided for @footerText.
  ///
  /// In en, this message translates to:
  /// **'© {year} Federico Viceconti. Crafted with Flutter.'**
  String footerText(int year);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'it'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'it':
      return AppLocalizationsIt();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
