import 'package:federicoviceconti_github_io/core/theme_data.dart';
import 'package:federicoviceconti_github_io/home_page/home_page_widget.dart';
import 'package:federicoviceconti_github_io/notifier/app_theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyPersonalWebsite extends StatelessWidget {
  // This widget is the root of your application.
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