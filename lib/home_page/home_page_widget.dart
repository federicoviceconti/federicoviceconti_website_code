import 'package:federicoviceconti_github_io/core/base_widget.dart';
import 'package:federicoviceconti_github_io/core/full_screen_widget.dart';
import 'package:federicoviceconti_github_io/home_page/about_me/about_me.dart';
import 'package:federicoviceconti_github_io/home_page/contacts/contacts_widget.dart';
import 'package:federicoviceconti_github_io/home_page/easter_egg/easter_egg_widget.dart';
import 'package:federicoviceconti_github_io/home_page/home_page_notifier.dart';
import 'package:federicoviceconti_github_io/home_page/page_enum.dart';
import 'package:federicoviceconti_github_io/home_page/who_am_i/who_am_i_widget.dart';
import 'package:federicoviceconti_github_io/home_page/widget/top_bar_widget.dart';
import 'package:federicoviceconti_github_io/utility/animation_helper.dart';
import 'package:federicoviceconti_github_io/utility/html_utility.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'widget/home_page_background_widget.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomePageNotifier>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: _buildBody(),
    );
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

    final provider = Provider.of<HomePageNotifier>(context, listen: false);
    final mouseRegion = MouseRegion(
      onEnter: (_) => provider.onMouseEnter(),
      onExit: (_) => provider.onMouseExit(MediaQuery.of(context).size),
      onHover: (details) => provider.onMouseHover(details, screenSize),
      child: stackPages,
    );

    return HtmlUtility.isMobile() ? stackPages : mouseRegion;
  }

  Widget _buildBackground() {
    return Consumer<HomePageNotifier>(builder: (_, notifier, __) {
      return HomePageBackgroundWidget(
        localX: notifier.localX,
        localY: notifier.localY,
        isDefaultPosition: notifier.defaultPosition,
      );
    });
  }

  Widget _buildTopBar() {
    return Consumer<HomePageNotifier>(builder: (_, notifier, __) {
      return Container(
        color: notifier.pageSelected != PageEnum.home
            ? Theme.of(context).colorScheme.background
            : Colors.transparent,
        padding: const EdgeInsets.only(top: 32),
        child: TopBarWidget(
          onPageChanged: (page) => notifier.animateToPage(page),
          onLogoTap: () => notifier.onLogoTap(context),
          pageSelected: notifier.pageSelected,
          showEasterEgg: notifier.showEasterEgg,
        ),
      );
    });
  }

  Widget _buildPageWidget() {
    final double _paddingHorizontal = 28.0;

    return Consumer<HomePageNotifier>(builder: (_, notifier, __) {
      return FullScreenWidget(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: _paddingHorizontal),
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: notifier.pageController,
            children: [
              WhoAmIWidget(),
              AboutMeWidget(),
              ContactsWidget(),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildEasterEgg() {
    return Consumer<HomePageNotifier>(builder: (_, notifier, __) {
      return AnimationHelper.buildSwitcher(
        notifier.showEasterEgg,
        childOnTrue: EasterEggWidget(
          onLogoTap: () => notifier.resetTouchLogo(context),
        ),
        childOnFalse: SizedBox(),
      );
    });
  }
}
