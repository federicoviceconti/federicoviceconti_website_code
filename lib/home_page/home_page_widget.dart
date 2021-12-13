import 'package:federicoviceconti_github_io/core/base_widget.dart';
import 'package:federicoviceconti_github_io/core/full_screen_widget.dart';
import 'package:federicoviceconti_github_io/home_page/about_me/about_me.dart';
import 'package:federicoviceconti_github_io/home_page/contacts/contacts_widget.dart';
import 'package:federicoviceconti_github_io/home_page/easter_egg/easter_egg_widget.dart';
import 'package:federicoviceconti_github_io/home_page/page_enum.dart';
import 'package:federicoviceconti_github_io/home_page/who_am_i/who_am_i_widget.dart';
import 'package:federicoviceconti_github_io/home_page/widget/top_bar_widget.dart';
import 'package:federicoviceconti_github_io/utility/animation_helper.dart';
import 'package:federicoviceconti_github_io/utility/firebase_analytics_helper.dart';
import 'package:federicoviceconti_github_io/utility/html_utility.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'widget/home_page_background_widget.dart';

class HomePageWidget extends StatefulWidget {
  static const int MAX_TOUCH_LOGO = 10;

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  int _touchLogo = HomePageWidget.MAX_TOUCH_LOGO;

  bool defaultPosition = true;

  double _localX = 0.0;
  double _localY = 0.0;
  double _offsetX = 0.0;
  double _offsetY = 0.0;

  PageEnum _pageSelected = PageEnum.home;

  DateTime? _easterEggStarted;

  final PageController _pageController =
      PageController(initialPage: PageEnum.home.pageIndex ?? 0);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(child: _buildBody());
  }

  Widget _buildBody() {
    final screenSize = MediaQuery.of(context).size;

    final stackPages = Stack(
      children: [
        _buildBackground(),
        _buildPageWidget(),
        _buildTopBar(),
        _buildEasterEgg(),
      ],
    );

    final mouseRegion = MouseRegion(
      onEnter: (_) => setState(() => defaultPosition = false),
      onExit: (_) => setState(() {
        _localY = (screenSize.height) / 2;
        _localX = (screenSize.width * 0.45) / 2;
        defaultPosition = true;
      }),
      onHover: (details) {
        if (details.localPosition.dx > 0 && details.localPosition.dy > 0) {
          if (details.localPosition.dx < screenSize.width &&
              details.localPosition.dy > 0) {
            setState(() {
              _localX = details.localPosition.dx + _offsetX;
              _localY = details.localPosition.dy + _offsetY;
            });
          }
        }
      },
      child: stackPages,
    );

    return HtmlUtility.isMobile() ? stackPages : mouseRegion;
  }

  Widget _buildBackground() {
    return HomePageBackgroundWidget(
      localX: _localX,
      localY: _localY,
      isDefaultPosition: defaultPosition,
    );
  }

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: TopBarWidget(
        onPageChanged: _animateToPage,
        onLogoTap: _onLogoTap,
        pageSelected: _pageSelected,
        showEasterEgg: _showEasterEgg,
      ),
    );
  }

  void _animateToPage(PageEnum page) {
    FirebaseAnalyticsHelper().setCurrentScreen(screenName: page.toString());

    _pageController.animateToPage(page.pageIndex!,
        duration: Duration(milliseconds: 500), curve: Curves.ease);

    setState(() {
      _pageSelected = page;
    });
  }

  Widget _buildPageWidget() {
    final double _paddingHorizontal = 28.0;

    return FullScreenWidget(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: _paddingHorizontal),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: [
            WhoAmIWidget(),
            AboutMeWidget(),
            ContactsWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildEasterEgg() {
    return AnimationHelper.buildSwitcher(
      _showEasterEgg,
      childOnTrue: EasterEggWidget(
        onLogoTap: () {
          _onLogoTap();
          _resetTouchLogo();
        },
      ),
      childOnFalse: SizedBox(),
    );
  }

  void _onLogoTap() {
    if (_pageSelected == PageEnum.home) {
      _onShowToastAndActiveEasterEgg();
    } else {
      _animateToPage(PageEnum.home);
    }
  }

  void _onShowToastAndActiveEasterEgg() {
    if (_touchLogo > 0 && _touchLogo < 7) {
      _showRemainingStepTouchLogo();
    }

    setState(() {
      _touchLogo--;
    });

    if (_touchLogo == 0) {
      FirebaseAnalyticsHelper().logEvent(
        name: FirebaseAnalyticsHelper.EASTER_EGG_FOUND,
      );

      setState(() {
        _easterEggStarted = DateTime.now();
      });
    }
  }

  void _showRemainingStepTouchLogo() {
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

  void _resetTouchLogo() {
    final now = DateTime.now();
    final secondsBeforeRestart = 1;

    if (_easterEggStarted == null ||
        (now.difference(_easterEggStarted ?? DateTime.now()).inSeconds >
            secondsBeforeRestart)) {
      setState(() {
        _touchLogo = HomePageWidget.MAX_TOUCH_LOGO;
      });
    }
  }

  bool get _showEasterEgg => _touchLogo < 1;
}
