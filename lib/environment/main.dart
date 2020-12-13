import 'package:federicoviceconti_github_io/utility/firebase_analytics_helper.dart';
import 'package:federicoviceconti_github_io/entrypoint/my_personal_website.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseAnalyticsHelper().initialize();
  runApp(MyPersonalWebsite());
}