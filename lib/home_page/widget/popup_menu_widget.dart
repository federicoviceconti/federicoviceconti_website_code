import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

import 'cursor_widget.dart';

class PopupMenuHome extends StatefulWidget {
  final void Function() onSwitchThemePress;

  const PopupMenuHome({
    Key? key,
    required this.onSwitchThemePress,
  }) : super(key: key);

  @override
  _PopupMenuHomeState createState() => _PopupMenuHomeState();
}

class _PopupMenuHomeState extends State<PopupMenuHome> {
  MenuSelected _selected = MenuSelected.none;

  @override
  Widget build(BuildContext context) {
    return MenuSelectedHelper.hasMoreThanOneItem() && _isSmallDeviceWidth()
        ? _buildPopup()
        : _buildMenuList();
  }

  bool _isSmallDeviceWidth() => MediaQuery.of(context).size.width < 500;

  Widget _buildPopup() {
    return PopupMenuButton<MenuSelected>(
      color: Theme.of(context).colorScheme.background,
      initialValue: _selected,
      onSelected: (itemSelected) {
        setState(() {
          _selected = itemSelected;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuSelected>>[
        PopupMenuItem<MenuSelected>(
          value: MenuSelected.theme,
          child: _buildSwitchTheme(
            isSelected: _selected == MenuSelected.theme,
            isPopupMenu: true,
          ),
        ),
      ],
      icon: Icon(
        Icons.menu,
        color: Theme.of(context).iconTheme.color,
      ),
    );
  }

  Widget _buildSwitchTheme({
    bool isSelected = false,
    bool isPopupMenu = false,
  }) {
    return CursorWidget(
      child: GestureDetector(
        onTap: () => widget.onSwitchThemePress(),
        child: Row(
          children: [
            Icon(
              Icons.brightness_4,
              color: Theme.of(context).iconTheme.color,
            ),
            isPopupMenu ? _buildPopupMenuText(isSelected) : const IgnorePointer(),
          ],
        ),
      ),
    );
  }

  Widget _buildPopupMenuText(bool isSelected) {
    final text = isSelected
        ? AppLocalizations.of(context)!.darkModeSelected
        : AppLocalizations.of(context)!.lightModeSelected;

    return Row(
      children: [
        SizedBox(width: 8),
        Text(
          text,
          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 14),
        ),
      ],
    );
  }

  Widget _buildMenuList() {
    return Row(
      children: [
        SizedBox(width: 6),
        _buildSwitchTheme(),
      ],
    );
  }
}

enum MenuSelected {
  none,
  theme,
}

class MenuSelectedHelper {
  static List<MenuSelected> getAll() {
    final items = MenuSelected.values;
    return items.where((element) => element != MenuSelected.none).toList();
  }

  static bool hasMoreThanOneItem() {
    return getAll().length > 1;
  }
}