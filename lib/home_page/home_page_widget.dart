import 'package:federicoviceconti_github_io/core/base_widget.dart';
import 'package:federicoviceconti_github_io/core/full_screen_widget.dart';
import 'package:federicoviceconti_github_io/home_page/about_me/about_me.dart';
import 'package:federicoviceconti_github_io/home_page/who_am_i/who_am_i_widget.dart';
import 'package:federicoviceconti_github_io/notifier/app_theme_notifier.dart';
import 'package:federicoviceconti_github_io/utility/html_utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widget/home_page_background_widget.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  bool defaultPosition = true;
  double _localX = 0.0;
  double _localY = 0.0;
  double _offsetX = 0.0;
  double _offsetY = 0.0;
  final PageController _pageController = PageController(initialPage: 0);

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
        FullScreenWidget(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: _pageController,
            children: [
              WhoAmIWidget(),
              AboutMeWidget()
            ],
          ),
        ),
        _buildTopBar(),
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _buildAboutMe(),
        _buildSwitchTheme(),
      ],
    );
  }

  Widget _buildAboutMe() {
    return GestureDetector(
      onTap: () => _animateToPage(1),
      child: Text(
        "About me",
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  _animateToPage(page) {
    _pageController.animateToPage(page, duration: Duration(milliseconds: 500), curve: Curves.ease);
  }

  Widget _buildSwitchTheme() {
    return Container(
      padding: const EdgeInsets.all(32.0),
      child: IconButton(
        color: Theme.of(context).iconTheme.color,
        onPressed: _onSwitchThemePress,
        icon: Icon(Icons.brightness_4),
      ),
    );
  }

  void _onSwitchThemePress() =>
      Provider.of<AppThemeNotifier>(context, listen: false).switchAppTheme();
}
