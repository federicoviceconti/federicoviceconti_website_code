import 'package:federicoviceconti_github_io/utility/firebase_analytics_helper.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'blog_item.dart';

class BlogNotifier extends ChangeNotifier {
  List<BlogItem> _blogItems = [];

  List<BlogItem> get blogItems => _blogItems;

  init() {
    _initItems();
  }

  _initItems() {
    _blogItems = [
      BlogItem(
        "How to create a bot with Dart and TeleDart and deploy on Heroku",
        "Step by step guide to building a bot with Dart and Teledart package and deploy on Heroku",
        "telegram",
        BlogType.medium,
        "https://medium.com/@viceconti.federico/how-to-deploy-your-telegram-bot-on-heroku-with-teledart-6ee197c0df91",
      ),
      BlogItem(
        "Why Flutter works! - Sapienza",
        "Explaing why Flutter rocks using real examples made in Flutter.",
        "flutter_works",
        BlogType.link,
        "https://sapienza-slides.web.app/",
      ),
    ];

    notifyListeners();
  }

  void onBlogItemTap(int index) async {
    final urlToOpen = _blogItems[index].path;

    if(await canLaunch(urlToOpen ?? '')) {
      launch(urlToOpen!);

      FirebaseAnalyticsHelper().logEvent(
        name: 'tap_blog_item',
        parameters: {
          'type': _blogItems[index].type.name
        },
      );
    }
  }
}
