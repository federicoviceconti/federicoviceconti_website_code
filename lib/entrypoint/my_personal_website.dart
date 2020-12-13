import 'package:federicoviceconti_github_io/core/theme_data.dart';
import 'package:federicoviceconti_github_io/home_page/home_page_widget.dart';
import 'package:federicoviceconti_github_io/notifier/app_theme_notifier.dart';
import 'package:federicoviceconti_github_io/utility/firebase_analytics_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPersonalWebsite extends StatefulWidget {
  @override
  _MyPersonalWebsiteState createState() => _MyPersonalWebsiteState();
}

class _MyPersonalWebsiteState extends State<MyPersonalWebsite> {
  @override
  void initState() {
    super.initState();
    FirebaseAnalyticsHelper().analytics.logAppOpen();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppThemeNotifier>(
      create: (context) => AppThemeNotifier(),
      builder: _buildMaterialApp
    );
  }

  Widget _buildMaterialApp(BuildContext context, Widget child) {
    return Consumer<AppThemeNotifier>(
      builder: (_, notifier, __) => MaterialApp(
        title: 'Federico Viceconti\'s Website',
        navigatorObservers: <NavigatorObserver>[FirebaseAnalyticsHelper().observer],
        darkTheme: CustomThemeData.darkTheme,
        theme: CustomThemeData.lightTheme,
        themeMode: notifier.currentAppTheme,
        home: Container(
          child: HomePageWidget(),
        ),
      ),
    );
  }
}