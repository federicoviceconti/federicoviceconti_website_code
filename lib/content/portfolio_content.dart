import 'package:federicoviceconti_github_io/l10n/app_localizations.dart';

typedef LocalizedValue = String Function(AppLocalizations l10n);

class ProjectContent {
  const ProjectContent({
    required this.title,
    required this.description,
    required this.stack,
    required this.liveUrl,
    this.sourceUrl,
  });

  final LocalizedValue title;
  final LocalizedValue description;
  final String stack;
  final String liveUrl;
  final String? sourceUrl;
}

class ExperienceContent {
  const ExperienceContent({
    required this.role,
    required this.period,
    required this.summary,
  });

  final LocalizedValue role;
  final LocalizedValue period;
  final LocalizedValue summary;
}

class PortfolioContent {
  static final skills = <String>[
    'Flutter',
    'Android',
    'REST APIs',
    'Git',
    'Jenkins',
    'Jira',
    'Firebase',
    'Supabase',
  ];

  static final projects = <ProjectContent>[
    ProjectContent(
      title: (l10n) => l10n.projectOneTitle,
      description: (l10n) => l10n.projectOneDescription,
      stack: 'Flutter, Dart',
      liveUrl: 'https://pub.dev/packages/card_stack_widget',
    ),
    ProjectContent(
      title: (l10n) => l10n.projectTwoTitle,
      description: (l10n) => l10n.projectTwoDescription,
      stack: 'Flutter, Dart, Twitch API',
      liveUrl: 'https://pub.dev/packages/unofficial_twitch_open_api',
    ),
    ProjectContent(
      title: (l10n) => l10n.projectThreeTitle,
      description: (l10n) => l10n.projectThreeDescription,
      stack: 'Flutter, Dart',
      liveUrl: 'https://github.com/federicoviceconti/flutter_slider',
      sourceUrl: 'https://github.com/federicoviceconti/flutter_slider',
    ),
    ProjectContent(
      title: (l10n) => l10n.projectFourTitle,
      description: (l10n) => l10n.projectFourDescription,
      stack: 'Flutter, Dart, Telegram Bot',
      liveUrl: 'https://github.com/federicoviceconti/covid_bot',
      sourceUrl: 'https://github.com/federicoviceconti/covid_bot',
    ),
    ProjectContent(
      title: (l10n) => l10n.projectFiveTitle,
      description: (l10n) => l10n.projectFiveDescription,
      stack: 'Flutter, Dart, A*',
      liveUrl: 'https://github.com/federicoviceconti/Journey-Demo',
      sourceUrl: 'https://github.com/federicoviceconti/Journey-Demo',
    ),
  ];

  static final experiences = <ExperienceContent>[
    ExperienceContent(
      role: (l10n) => l10n.experienceOneRole,
      period: (l10n) => l10n.experienceOnePeriod,
      summary: (l10n) => l10n.experienceOneSummary,
    ),
    ExperienceContent(
      role: (l10n) => l10n.experienceTwoRole,
      period: (l10n) => l10n.experienceTwoPeriod,
      summary: (l10n) => l10n.experienceTwoSummary,
    ),
    ExperienceContent(
      role: (l10n) => l10n.experienceThreeRole,
      period: (l10n) => l10n.experienceThreePeriod,
      summary: (l10n) => l10n.experienceThreeSummary,
    ),
  ];
}
