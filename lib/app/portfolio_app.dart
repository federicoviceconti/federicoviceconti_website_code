import 'package:federicoviceconti_github_io/app/app_state_controller.dart';
import 'package:federicoviceconti_github_io/app/theme/app_theme.dart';
import 'package:federicoviceconti_github_io/features/portfolio/portfolio_page.dart';
import 'package:federicoviceconti_github_io/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class PortfolioApp extends StatefulWidget {
  const PortfolioApp({super.key});

  @override
  State<PortfolioApp> createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> {
  final AppStateController _controller = AppStateController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateTitle: (context) => AppLocalizations.of(context)!.appTitle,
          locale: _controller.locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          themeMode: _controller.themeMode,
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          home: PortfolioPage(controller: _controller),
        );
      },
    );
  }
}
