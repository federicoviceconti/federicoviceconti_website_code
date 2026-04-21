// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Federico Viceconti | Flutter Developer';

  @override
  String get navigation => 'Navigation';

  @override
  String get navAbout => 'About';

  @override
  String get navCurrentWork => 'Current work';

  @override
  String get navProjects => 'Projects';

  @override
  String get navExperience => 'Experience';

  @override
  String get navContact => 'Contact';

  @override
  String get lightMode => 'Switch to light mode';

  @override
  String get darkMode => 'Switch to dark mode';

  @override
  String get heroEyebrow => 'Flutter Developer';

  @override
  String get heroTitle =>
      'Hello, I\'m Federico. I build polished mobile and web experiences with Flutter.';

  @override
  String get heroSubtitle =>
      'Android developer, Flutter enthusiast, and lifelong learner based in Rome. I love combining clean architecture with delightful UX.';

  @override
  String get heroPrimaryCta => 'Explore projects';

  @override
  String get heroSecondaryCta => 'Let\'s talk';

  @override
  String get heroScrollHint => 'Scroll to discover more';

  @override
  String get aboutTitle => 'About me';

  @override
  String get aboutDescription =>
      'Developer, lifelong learner and music lover. Born in 1997 in southern Italy, now based in Rome. I fell in love with Android development and currently focus on creating lovely and functional apps with Flutter.';

  @override
  String get currentWorkTitle => 'What I\'m working on';

  @override
  String get currentWorkHeading => 'Mobile Developer @ Wind Tre S.p.A.';

  @override
  String get currentWorkDescription =>
      'Working in the IT Development team as App Developer. Main technologies: Flutter and Git.';

  @override
  String get currentWorkTags => 'Flutter,Android,Git,Mobile';

  @override
  String get projectsTitle => 'Selected projects';

  @override
  String get projectsSubtitle =>
      'Real side projects I\'ve built and maintained with Flutter and Dart.';

  @override
  String get projectOneTitle => 'card_stack_widget';

  @override
  String get projectOneDescription =>
      'A vertical dismissible and customizable stack of cards for Flutter applications.';

  @override
  String get projectTwoTitle => 'unofficial_twitch_open_api';

  @override
  String get projectTwoDescription =>
      'Wrapper for the newest Twitch API, available on pub.dev. It exposes channels, media, search, and game data.';

  @override
  String get projectThreeTitle => 'flutter_slider';

  @override
  String get projectThreeDescription =>
      'Creates slides from a JSON file. The presentation adapts to different screen resolutions.';

  @override
  String get projectFourTitle => 'covid_bot';

  @override
  String get projectFourDescription =>
      'Telegram bot that fetches free API data to provide the latest COVID-19 updates.';

  @override
  String get projectFiveTitle => 'journey_demo';

  @override
  String get projectFiveDescription =>
      'Journey planner prototype using A* algorithm and OpenCharge API data for charging stations.';

  @override
  String get openProject => 'Open';

  @override
  String get sourceCode => 'Source';

  @override
  String get experienceTitle => 'Experience';

  @override
  String get experienceOneRole => 'Mobile Developer · Wind Tre S.p.A.';

  @override
  String get experienceOnePeriod => '2022 - Present';

  @override
  String get experienceOneSummary =>
      'Development and maintenance of the WindTre app, and migration of the X Cube and Very Mobile apps to Flutter, ensuring their continuous evolution.';

  @override
  String get experienceTwoRole => 'Digital Engineer · NTT DATA';

  @override
  String get experienceTwoPeriod => '2020 - 2022';

  @override
  String get experienceTwoSummary =>
      'Development of native and hybrid Android applications (Xamarin, Flutter), along with building and maintaining web portals using React.';

  @override
  String get experienceThreeRole => 'Software Developer · Vetrya';

  @override
  String get experienceThreePeriod => '2018 - 2020';

  @override
  String get experienceThreeSummary =>
      'Built application features across multiple technologies and strengthened full-product delivery skills from design handoff to production.';

  @override
  String get contactTitle => 'Let\'s build something meaningful';

  @override
  String get contactSubtitle =>
      'If you\'re looking for a developer focused on product quality and execution, feel free to reach out.';

  @override
  String get contactEmail => 'Email me';

  @override
  String footerText(int year) {
    return '© $year Federico Viceconti. Crafted with Flutter.';
  }
}
