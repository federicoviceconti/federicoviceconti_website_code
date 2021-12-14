import 'package:federicoviceconti_github_io/home_page/widget/popup_menu_widget.dart';
import 'package:federicoviceconti_github_io/notifier/app_theme_notifier.dart';
import 'package:federicoviceconti_github_io/utility/animation_helper.dart';
import 'package:flutter/material.dart';
import 'package:federicoviceconti_github_io/home_page/widget/logo_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../page_enum.dart';
import 'cursor_widget.dart';

class TopBarWidget extends StatefulWidget {
  final bool showEasterEgg;

  final void Function() onLogoTap;

  final void Function(PageEnum) onPageChanged;

  final PageEnum pageSelected;

  const TopBarWidget({
    Key? key,
    required this.onPageChanged,
    required this.showEasterEgg,
    required this.onLogoTap,
    required this.pageSelected,
  }) : super(key: key);

  @override
  State<TopBarWidget> createState() => _TopBarWidgetState();
}

class _TopBarWidgetState extends State<TopBarWidget> {
  final double _paddingHorizontal = 28.0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildLogo(),
        _buildNavItems(),
      ],
    );
  }

  Widget _buildNavItems() {
    final showNavItems = MediaQuery.of(context).size.width > 200;

    return Visibility(
      visible: showNavItems,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _buildNavButton(
            AppLocalizations.of(context)!.aboutMe,
            page: PageEnum.aboutMe,
          ),
          SizedBox(width: 20.0),
          _buildNavButton(
            AppLocalizations.of(context)!.contacts,
            page: PageEnum.contacts,
          ),
          SizedBox(width: 12.0),
          _buildOptionMenu(),
          SizedBox(width: 20.0),
        ],
      ),
    );
  }

  Widget _buildLogo() {
    return AnimationHelper.buildSwitcher(
      !widget.showEasterEgg,
      childOnTrue: Padding(
        padding: EdgeInsets.only(left: _paddingHorizontal),
        child: LogoWidget(
          onLogoTap: () => widget.onLogoTap(),
        ),
      ),
      childOnFalse: SizedBox(),
    );
  }

  Widget _buildOptionMenu() {
    return PopupMenuHome(
      onSwitchThemePress: _onSwitchThemePress,
    );
  }

  Widget _buildNavButton(String text, {PageEnum page = PageEnum.home}) {
    return GestureDetector(
      onTap: () => widget.onPageChanged(page),
      child: CursorWidget(
        child: Wrap(
          children: [
            Column(
              children: [
                Text(
                  text,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(height: 4.0),
                _buildUnderlineNav(
                  conditionToShow: widget.pageSelected == page,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUnderlineNav({bool conditionToShow = false}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: conditionToShow ? 40.0 : 0.0,
      height: conditionToShow ? 1.0 : 0.0,
      curve: Curves.easeIn,
      child: Container(
        color: Theme.of(context).colorScheme.primary,
      ),
    );
  }

  void _onSwitchThemePress() =>
      Provider.of<AppThemeNotifier>(context, listen: false).switchAppTheme();
}
