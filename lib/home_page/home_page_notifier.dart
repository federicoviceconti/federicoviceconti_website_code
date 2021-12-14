import 'package:federicoviceconti_github_io/utility/firebase_analytics_helper.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'page_enum.dart';

class HomePageNotifier extends ChangeNotifier {
  static const int MAX_TOUCH_LOGO = 10;

  int _touchLogo = MAX_TOUCH_LOGO;

  bool _defaultPosition = true;

  double _localX = 0.0;
  double _localY = 0.0;
  double _offsetX = 0.0;
  double _offsetY = 0.0;

  PageEnum _pageSelected = PageEnum.home;

  DateTime? _easterEggStarted;

  final PageController _pageController =
      PageController(initialPage: PageEnum.home.pageIndex ?? 0, viewportFraction: 0.9999);

  void init() async {
    final info = await PackageInfo.fromPlatform();
    print("Version ${info.version}_${info.buildNumber}");
  }

  void onMouseEnter() {
    _defaultPosition = false;
    notifyListeners();
  }

  void onMouseExit(Size screenSize) {
    _localY = (screenSize.height) / 2;
    _localX = (screenSize.width * 0.45) / 2;
    _defaultPosition = true;
    notifyListeners();
  }

  void onMouseHover(PointerHoverEvent details, Size screenSize) {
    if (details.localPosition.dx > 0 && details.localPosition.dy > 0) {
      if (details.localPosition.dx < screenSize.width &&
          details.localPosition.dy > 0) {
        _localX = details.localPosition.dx + _offsetX;
        _localY = details.localPosition.dy + _offsetY;
        notifyListeners();
      }
    }
  }

  void animateToPage(PageEnum page) async {
    if (_pageSelected != page) {
      FirebaseAnalyticsHelper().setCurrentScreen(screenName: page.toString());

      await _pageController.animateToPage(
        page.pageIndex!,
        duration: Duration(milliseconds: 500),
        curve: Curves.ease,
      );

      _pageSelected = page;
      notifyListeners();
    }
  }

  void onLogoTap(BuildContext context) {
    if (_pageSelected == PageEnum.home) {
      _onShowToastAndActiveEasterEgg(context);
    } else {
      animateToPage(PageEnum.home);
    }
  }

  void _onShowToastAndActiveEasterEgg(BuildContext context) {
    if (_touchLogo > 0 && _touchLogo < 7) {
      _showRemainingStepTouchLogo(context);
    }

    _touchLogo--;

    if (_touchLogo == 0) {
      FirebaseAnalyticsHelper().logEvent(
        name: FirebaseAnalyticsHelper.EASTER_EGG_FOUND,
      );

      _easterEggStarted = DateTime.now();
    }

    notifyListeners();
  }

  void _showRemainingStepTouchLogo(BuildContext context) {
    Fluttertoast.showToast(
      msg: AppLocalizations.of(context)!
          .touchLogo
          .replaceAll('{0}', _touchLogo.toString()),
      gravity: ToastGravity.BOTTOM,
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Theme.of(context).colorScheme.primary,
      webBgColor: Theme.of(context).colorScheme.background == Colors.white
          ? 'black'
          : 'white',
      textColor: Theme.of(context).colorScheme.background == Colors.white
          ? Colors.white
          : Colors.black,
    );
  }

  void resetTouchLogo(BuildContext context) {
    onLogoTap(context);

    final now = DateTime.now();
    final secondsBeforeRestart = 1;

    if (_easterEggStarted == null ||
        (now.difference(_easterEggStarted ?? DateTime.now()).inSeconds >
            secondsBeforeRestart)) {
      _touchLogo = MAX_TOUCH_LOGO;
      notifyListeners();
    }
  }

  bool get defaultPosition => _defaultPosition;

  double get localX => _localX;

  double get localY => _localY;

  PageEnum get pageSelected => _pageSelected;

  bool get showEasterEgg => _touchLogo < 1;

  PageController get pageController => _pageController;
}
