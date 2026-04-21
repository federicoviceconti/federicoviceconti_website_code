// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appTitle => 'Federico Viceconti | Flutter Developer';

  @override
  String get navigation => 'Navigazione';

  @override
  String get navAbout => 'Chi sono';

  @override
  String get navCurrentWork => 'In corso';

  @override
  String get navProjects => 'Progetti';

  @override
  String get navExperience => 'Esperienza';

  @override
  String get navContact => 'Contatti';

  @override
  String get lightMode => 'Passa al tema chiaro';

  @override
  String get darkMode => 'Passa al tema scuro';

  @override
  String get heroEyebrow => 'Flutter Developer';

  @override
  String get heroTitle =>
      'Ciao, sono Federico. Realizzo esperienze mobile e web curate con Flutter.';

  @override
  String get heroSubtitle =>
      'Android developer, Flutter enthusiast e lifelong learner, basato a Roma. Mi piace unire clean architecture e UX di qualita\'.';

  @override
  String get heroPrimaryCta => 'Esplora i progetti';

  @override
  String get heroSecondaryCta => 'Parliamone';

  @override
  String get heroScrollHint => 'Scorri per scoprire di piu\'';

  @override
  String get aboutTitle => 'Chi sono';

  @override
  String get aboutDescription =>
      'Sviluppatore, lifelong learner e amante della musica. Nato nel 1997 nel sud Italia, ora vivo a Roma. Amo lo sviluppo Android e attualmente mi concentro su app funzionali e curate con Flutter.';

  @override
  String get currentWorkTitle => 'Su cosa sto lavorando';

  @override
  String get currentWorkHeading => 'Mobile Developer @ Wind Tre S.p.A.';

  @override
  String get currentWorkDescription =>
      'Lavoro nel team IT Development come App Developer. Tecnologie principali: Flutter e Git.';

  @override
  String get currentWorkTags => 'Flutter,Android,Git,Mobile';

  @override
  String get projectsTitle => 'Progetti selezionati';

  @override
  String get projectsSubtitle =>
      'Progetti reali che ho sviluppato e mantenuto con Flutter e Dart.';

  @override
  String get projectOneTitle => 'card_stack_widget';

  @override
  String get projectOneDescription =>
      'Uno stack verticale di card, dismissibile e personalizzabile, per applicazioni Flutter.';

  @override
  String get projectTwoTitle => 'unofficial_twitch_open_api';

  @override
  String get projectTwoDescription =>
      'Wrapper per le nuove API Twitch, disponibile su pub.dev. Espone dati su canali, media, ricerca e giochi.';

  @override
  String get projectThreeTitle => 'flutter_slider';

  @override
  String get projectThreeDescription =>
      'Crea slide da un file JSON. La presentazione si adatta a diverse risoluzioni.';

  @override
  String get projectFourTitle => 'covid_bot';

  @override
  String get projectFourDescription =>
      'Bot Telegram che recupera dati da API gratuite per fornire gli ultimi aggiornamenti sul COVID-19.';

  @override
  String get projectFiveTitle => 'journey_demo';

  @override
  String get projectFiveDescription =>
      'Prototipo di journey planner che usa algoritmo A* e dati OpenCharge API per le stazioni di ricarica.';

  @override
  String get openProject => 'Apri';

  @override
  String get sourceCode => 'Sorgente';

  @override
  String get experienceTitle => 'Esperienza';

  @override
  String get experienceOneRole => 'Mobile Developer · Wind Tre S.p.A.';

  @override
  String get experienceOnePeriod => '2022 - Oggi';

  @override
  String get experienceOneSummary =>
      'Sviluppo e manutenzione dell’app WindTre e migrazione a Flutter delle app X Cube e Very Mobile, con relativa manutenzione evolutiva.';

  @override
  String get experienceTwoRole => 'Digital Engineer · NTT DATA';

  @override
  String get experienceTwoPeriod => '2020 - 2022';

  @override
  String get experienceTwoSummary =>
      'Sviluppo di applicazioni Android native e ibride (Xamarin, Flutter), realizzazione e manutenzione di portali web con React.';

  @override
  String get experienceThreeRole => 'Software Developer · Vetrya';

  @override
  String get experienceThreePeriod => '2018 - 2020';

  @override
  String get experienceThreeSummary =>
      'Ho realizzato feature applicative su più tecnologie, rafforzando le competenze di delivery end-to-end dal design alla produzione.';

  @override
  String get contactTitle => 'Costruiamo qualcosa di utile';

  @override
  String get contactSubtitle =>
      'Se cerchi uno sviluppatore focalizzato su qualita\' di prodotto ed execution, scrivimi pure.';

  @override
  String get contactEmail => 'Scrivimi';

  @override
  String footerText(int year) {
    return '© $year Federico Viceconti. Creato con Flutter.';
  }
}
