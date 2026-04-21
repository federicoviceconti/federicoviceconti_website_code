import 'package:federicoviceconti_github_io/app/app_state_controller.dart';
import 'package:federicoviceconti_github_io/app/theme/grid_background.dart';
import 'package:federicoviceconti_github_io/app/theme/spacing.dart';
import 'package:federicoviceconti_github_io/content/portfolio_content.dart';
import 'package:federicoviceconti_github_io/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum PortfolioSection { hero, about, currentWork, projects, experience, contact }

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({
    required this.controller,
    super.key,
  });

  final AppStateController controller;

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();
  final Map<PortfolioSection, GlobalKey> _sectionKeys = {
    for (final section in PortfolioSection.values) section: GlobalKey(),
  };

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _scrollToSection(PortfolioSection section) async {
    final sectionContext = _sectionKeys[section]?.currentContext;
    if (sectionContext == null) {
      return;
    }
    await Scrollable.ensureVisible(
      sectionContext,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOutCubic,
      alignment: 0.04,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isCompact = MediaQuery.of(context).size.width < 920;
    final sectionPadding = EdgeInsets.symmetric(
      horizontal: isCompact ? AppSpacing.lg : AppSpacing.xxl,
      vertical: isCompact ? AppSpacing.xl : AppSpacing.xxl,
    );

    return Scaffold(
      body: AppGridBackground(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.surface,
                Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.35),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: CustomScrollView(
          controller: _scrollController,
          slivers: [
            SliverAppBar(
              pinned: true,
              toolbarHeight: 82,
              titleSpacing: 0,
              title: _TopNavigation(
                isCompact: isCompact,
                onNavigate: _scrollToSection,
                onToggleTheme: widget.controller.toggleTheme,
                onToggleLocale: widget.controller.toggleLocale,
                localeLabel: widget.controller.isItalian ? 'IT' : 'EN',
                themeLabel: widget.controller.isDarkMode ? l10n.lightMode : l10n.darkMode,
              ),
            ),
            SliverToBoxAdapter(
              child: _SectionContainer(
                key: _sectionKeys[PortfolioSection.hero],
                padding: EdgeInsets.symmetric(
                  horizontal: isCompact ? AppSpacing.lg : AppSpacing.xxl,
                ),
                child: _HeroSection(
                  onProjectsTap: () => _scrollToSection(PortfolioSection.projects),
                  onContactTap: () => _scrollToSection(PortfolioSection.contact),
                  onScrollTap: () => _scrollToSection(PortfolioSection.about),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _SectionContainer(
                key: _sectionKeys[PortfolioSection.about],
                padding: sectionPadding,
                child: _AboutSection(
                  skills: PortfolioContent.skills,
                  headerIndex: '01',
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _SectionContainer(
                key: _sectionKeys[PortfolioSection.currentWork],
                padding: sectionPadding,
                child: const _CurrentWorkSection(headerIndex: '02'),
              ),
            ),
            SliverToBoxAdapter(
              child: _SectionContainer(
                key: _sectionKeys[PortfolioSection.projects],
                padding: sectionPadding,
                child: _ProjectsSection(
                  projects: PortfolioContent.projects,
                  headerIndex: '03',
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _SectionContainer(
                key: _sectionKeys[PortfolioSection.experience],
                padding: sectionPadding,
                child: _ExperienceSection(
                  experiences: PortfolioContent.experiences,
                  headerIndex: '04',
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: _SectionContainer(
                key: _sectionKeys[PortfolioSection.contact],
                padding: sectionPadding,
                child: const _ContactSection(headerIndex: '05'),
              ),
            ),
          ],
        ),
        ),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({
    required this.index,
    required this.title,
  });

  final String index;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '$index / ',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        Expanded(
          child: Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Expanded(
          flex: 2,
          child: Divider(
            color: Theme.of(context).dividerTheme.color,
          ),
        ),
      ],
    );
  }
}

class _TopNavigation extends StatelessWidget {
  const _TopNavigation({
    required this.isCompact,
    required this.onNavigate,
    required this.onToggleTheme,
    required this.onToggleLocale,
    required this.localeLabel,
    required this.themeLabel,
  });

  final bool isCompact;
  final ValueChanged<PortfolioSection> onNavigate;
  final VoidCallback onToggleTheme;
  final VoidCallback onToggleLocale;
  final String localeLabel;
  final String themeLabel;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final navItems = <({PortfolioSection section, String label})>[
      (section: PortfolioSection.about, label: l10n.navAbout),
      (section: PortfolioSection.currentWork, label: l10n.navCurrentWork),
      (section: PortfolioSection.projects, label: l10n.navProjects),
      (section: PortfolioSection.experience, label: l10n.navExperience),
      (section: PortfolioSection.contact, label: l10n.navContact),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      child: Row(
        children: [
          TextButton(
            onPressed: () => onNavigate(PortfolioSection.hero),
            child: Text(
              'Federico Viceconti',
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Spacer(),
          if (isCompact)
            PopupMenuButton<PortfolioSection>(
              tooltip: l10n.navigation,
              onSelected: onNavigate,
              itemBuilder: (context) => [
                for (final item in navItems)
                  PopupMenuItem(
                    value: item.section,
                    child: Text(item.label),
                  ),
              ],
              icon: const Icon(Icons.menu_rounded),
            )
          else
            Wrap(
              spacing: 4,
              children: [
                for (final item in navItems)
                  TextButton(
                    onPressed: () => onNavigate(item.section),
                    child: Text(item.label),
                  ),
              ],
            ),
          const SizedBox(width: 8),
          TextButton(
            onPressed: onToggleLocale,
            child: Text(localeLabel),
          ),
          const SizedBox(width: AppSpacing.xs),
          IconButton(
            tooltip: themeLabel,
            onPressed: onToggleTheme,
            icon: const Icon(Icons.brightness_6_rounded),
          ),
        ],
      ),
    );
  }
}

class _SectionContainer extends StatelessWidget {
  const _SectionContainer({
    required super.key,
    required this.padding,
    required this.child,
  });

  final EdgeInsets padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: AppSpacing.pageMaxWidth),
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

class _HeroSection extends StatelessWidget {
  const _HeroSection({
    required this.onProjectsTap,
    required this.onContactTap,
    required this.onScrollTap,
  });

  final VoidCallback onProjectsTap;
  final VoidCallback onContactTap;
  final VoidCallback onScrollTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    final compact = size.width < 760;
    final heroHeight = (size.height - 90).clamp(480.0, 920.0).toDouble();

    return _AnimatedSection(
      child: SizedBox(
        height: heroHeight,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: heroHeight),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.heroEyebrow,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      l10n.heroTitle,
                      style: compact
                          ? Theme.of(context).textTheme.displaySmall
                          : Theme.of(context).textTheme.displayMedium,
                    ),
                    const SizedBox(height: AppSpacing.md),
                    ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 760),
                      child: Text(
                        l10n.heroSubtitle,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.lg),
                    Wrap(
                      spacing: AppSpacing.sm,
                      runSpacing: AppSpacing.sm,
                      children: [
                        FilledButton(
                          onPressed: onProjectsTap,
                          child: Text(l10n.heroPrimaryCta),
                        ),
                        OutlinedButton(
                          onPressed: onContactTap,
                          child: Text(l10n.heroSecondaryCta),
                        ),
                      ],
                    ),
                    const SizedBox(height: AppSpacing.xl),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: onScrollTap,
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        label: Text(l10n.heroScrollHint),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection({
    required this.skills,
    required this.headerIndex,
  });

  final List<String> skills;
  final String headerIndex;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _AnimatedSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(index: headerIndex, title: l10n.aboutTitle),
          const SizedBox(height: AppSpacing.md),
          Text(l10n.aboutTitle, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: AppSpacing.sm),
          Text(l10n.aboutDescription, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: skills.map((skill) => Chip(label: Text(skill))).toList(),
          ),
        ],
      ),
    );
  }
}

class _CurrentWorkSection extends StatelessWidget {
  const _CurrentWorkSection({required this.headerIndex});

  final String headerIndex;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _AnimatedSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(index: headerIndex, title: l10n.currentWorkTitle),
          const SizedBox(height: AppSpacing.md),
          Text(l10n.currentWorkTitle, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: AppSpacing.sm),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.currentWorkHeading, style: Theme.of(context).textTheme.titleLarge),
                  const SizedBox(height: AppSpacing.xs),
                  Text(l10n.currentWorkDescription, style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(height: AppSpacing.md),
                  Wrap(
                    spacing: AppSpacing.xs,
                    runSpacing: AppSpacing.xs,
                    children: [
                      for (final tag in l10n.currentWorkTags.split(','))
                        Chip(label: Text(tag.trim())),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection({
    required this.projects,
    required this.headerIndex,
  });

  final List<ProjectContent> projects;
  final String headerIndex;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _AnimatedSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(index: headerIndex, title: l10n.projectsTitle),
          const SizedBox(height: AppSpacing.md),
          Text(l10n.projectsTitle, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: AppSpacing.sm),
          Text(l10n.projectsSubtitle, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: AppSpacing.lg),
          for (var i = 0; i < projects.length; i++) ...[
            _ProjectRow(
              index: i + 1,
              project: projects[i],
            ),
            if (i != projects.length - 1) const SizedBox(height: AppSpacing.md),
          ],
        ],
      ),
    );
  }
}

class _ProjectRow extends StatefulWidget {
  const _ProjectRow({
    required this.index,
    required this.project,
  });

  final int index;
  final ProjectContent project;

  @override
  State<_ProjectRow> createState() => _ProjectRowState();
}

class _ProjectRowState extends State<_ProjectRow> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final title = widget.project.title(l10n);
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 160),
        curve: Curves.easeOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: Theme.of(context).colorScheme.outline.withValues(alpha: _hovered ? 0.95 : 0.6),
          ),
          color: Theme.of(context).colorScheme.surfaceContainerHighest.withValues(alpha: 0.42),
        ),
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '> ',
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.xs,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        '#${widget.index.toString().padLeft(2, '0')}',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    widget.project.description(l10n),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Wrap(
                    spacing: AppSpacing.xs,
                    runSpacing: AppSpacing.xs,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Chip(label: Text(widget.project.stack)),
                      TextButton(
                        onPressed: () => _launch(widget.project.liveUrl),
                        child: Text(l10n.openProject),
                      ),
                      if (widget.project.sourceUrl case final source?)
                        OutlinedButton(
                          onPressed: () => _launch(source),
                          child: Text(l10n.sourceCode),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExperienceSection extends StatelessWidget {
  const _ExperienceSection({
    required this.experiences,
    required this.headerIndex,
  });

  final List<ExperienceContent> experiences;
  final String headerIndex;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _AnimatedSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(index: headerIndex, title: l10n.experienceTitle),
          const SizedBox(height: AppSpacing.md),
          Text(l10n.experienceTitle, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: AppSpacing.md),
          for (final item in experiences)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.role(l10n), style: Theme.of(context).textTheme.titleLarge),
                      const SizedBox(height: AppSpacing.xs),
                      Text(item.period(l10n), style: Theme.of(context).textTheme.labelLarge),
                      const SizedBox(height: AppSpacing.xs),
                      Text(item.summary(l10n), style: Theme.of(context).textTheme.bodyLarge),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _ContactSection extends StatelessWidget {
  const _ContactSection({required this.headerIndex});

  final String headerIndex;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _AnimatedSection(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionHeader(index: headerIndex, title: l10n.contactTitle),
          const SizedBox(height: AppSpacing.md),
          Text(l10n.contactTitle, style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: AppSpacing.sm),
          Text(l10n.contactSubtitle, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.sm,
            runSpacing: AppSpacing.sm,
            children: [
              FilledButton.icon(
                onPressed: () => _launch('mailto:viceconti.federico@gmail.com'),
                icon: const Icon(Icons.email_outlined),
                label: Text(l10n.contactEmail),
              ),
              OutlinedButton.icon(
                onPressed: () => _launch('https://github.com/federicoviceconti'),
                icon: const Icon(Icons.code_rounded),
                label: const Text('GitHub'),
              ),
              OutlinedButton.icon(
                onPressed: () => _launch('https://www.linkedin.com/in/federicoviceconti/'),
                icon: const Icon(Icons.business_center_outlined),
                label: const Text('LinkedIn'),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(
            l10n.footerText(DateTime.now().year),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}

class _AnimatedSection extends StatefulWidget {
  const _AnimatedSection({required this.child});

  final Widget child;

  @override
  State<_AnimatedSection> createState() => _AnimatedSectionState();
}

class _AnimatedSectionState extends State<_AnimatedSection> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 520),
  )..forward();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: CurvedAnimation(parent: _controller, curve: Curves.easeOut),
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.03),
          end: Offset.zero,
        ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic)),
        child: widget.child,
      ),
    );
  }
}

Future<void> _launch(String url) async {
  final uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.platformDefault)) {
    throw Exception('Could not open $url');
  }
}
