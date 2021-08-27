import 'package:federicoviceconti_github_io/core/theme_data.dart';
import 'package:federicoviceconti_github_io/home_page/home_page_widget.dart';
import 'package:federicoviceconti_github_io/notifier/app_theme_notifier.dart';
import 'package:federicoviceconti_github_io/utility/firebase_analytics_helper.dart';
import 'package:federicoviceconti_github_io/utility/html_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyPersonalWebsite extends StatefulWidget {
  @override
  _MyPersonalWebsiteState createState() => _MyPersonalWebsiteState();
}

class _MyPersonalWebsiteState extends State<MyPersonalWebsite> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalyticsHelper().logAppOpen();
    HtmlUtility.printAsciiArt();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppThemeNotifier>(
      create: (context) => AppThemeNotifier(),
      builder: _buildMaterialApp,
    );
  }

  Widget _buildMaterialApp(BuildContext context, Widget? child) {
    return Consumer<AppThemeNotifier>(
      builder: (_, notifier, __) => MaterialApp(
        onGenerateTitle: (BuildContext ctx) => AppLocalizations.of(ctx)!.webAppTitle,
        navigatorObservers: <NavigatorObserver>[
          FirebaseAnalyticsHelper().observer
        ],
        darkTheme: CustomThemeData.darkTheme,
        theme: CustomThemeData.lightTheme,
        themeMode: notifier.currentAppTheme,
        home: Container(
          child: HomePageWidget(),
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalizations.delegate
        ],
        supportedLocales: [
          const Locale.fromSubtags(languageCode: 'en'),
        ],
      ),
    );
  }
}
