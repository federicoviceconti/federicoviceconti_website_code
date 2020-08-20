import 'package:federicoviceconti_github_io/core/base_widget.dart';
import 'package:federicoviceconti_github_io/notifier/app_theme_notifier.dart';
import 'package:federicoviceconti_github_io/utility/proportion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'home_page_background_widget.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  double _mailOpacity = 1.0;
  double _copyClipboardOpacity = 0.0;
  bool defaultPosition = true;
  double localX = 0.0;
  double localY = 0.0;

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

    return SingleChildScrollView(
      child: MouseRegion(
        onEnter: (_) => setState(() => defaultPosition = false),
        onExit: (_) => setState(() {
          localY = (screenSize.height) / 2;
          localX = (screenSize.width * 0.45) / 2;
          defaultPosition = true;
        }),
        onHover: (details) {
          if (details.localPosition.dx > 0 && details.localPosition.dy > 0) {
            if (details.localPosition.dx < (screenSize.width * 0.45) * 2.5 &&
                details.localPosition.dy > 0) {
              setState(() {
                localX = details.localPosition.dx;
                localY = details.localPosition.dy;
              });
            }
          }
        },
        child: Stack(
          children: [
            _buildBackground(screenSize),
            _buildWhoAmI(screenSize),
            _buildMail(screenSize),
            _buildCopiedText(screenSize),
            _buildSwitchTheme(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground(Size screenSize) {
    return HomePageBackgroundWidget(
      screenSize,
      localX: localX,
      localY: localY,
      isDefaultPosition: defaultPosition,
    );
  }

  Widget _buildWhoAmI(Size screenSize) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20.0),
      width: screenSize.width,
      height: screenSize.height,
      child: _buildWelcomeText(32),
    );
  }

  Widget _buildWelcomeText(double fontSize) {
    final welcomeText =
        "Hello, I'm Federico!\nAndroid developer, Flutter enthusiast.\nFrom Rome, 🇮🇹";

    return Text(
      welcomeText,
      style: Theme.of(context).textTheme.headline4.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: Proportion.getProportionalValueOnLongSize(
              context,
              fontSize,
            ),
          ),
    );
  }

  Widget _buildMail(Size screenSize) {
    return AnimatedOpacity(
      opacity: _mailOpacity,
      duration: Duration(milliseconds: 100),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: screenSize.width,
        height: screenSize.height,
        alignment: Alignment.bottomLeft,
        child: GestureDetector(
          onTap: _onTapMail,
          child: Text(
            "Say hello to viceconti.federico@gmail.com 👋",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTheme() {
    final screenSize = MediaQuery.of(context).size;

    return Container(
        padding: const EdgeInsets.all(32.0),
        width: screenSize.width,
        height: screenSize.height,
        alignment: Alignment.topRight,
        child: IconButton(
          color: Theme.of(context).iconTheme.color,
          onPressed: _onSwitchThemePress,
          icon: Icon(Icons.brightness_4),
        ));
  }

  void _onSwitchThemePress() {
    Provider.of<AppThemeNotifier>(context, listen: false).switchAppTheme();
  }

  void _onTapMail() {
    Clipboard.setData(ClipboardData(text: "viceconti.federico@gmail.com"));

    _showMailWithOpacity(false);
    _showCopyClipboardWithOpacity(true);

    Future.delayed(Duration(seconds: 3), () {
      _showMailWithOpacity(true);
      _showCopyClipboardWithOpacity(false);
    });
  }

  Widget _buildCopiedText(Size screenSize) {
    return AnimatedPositioned(
      bottom: _copyClipboardOpacity == 1 ? 0 : -30,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeIn,
      child: AnimatedOpacity(
        opacity: _copyClipboardOpacity,
        duration: Duration(milliseconds: 300),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: screenSize.width,
          height: screenSize.height,
          alignment: Alignment.bottomRight,
          child: RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              text: "viceconti.federico@gmail.com",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              children: [
                TextSpan(
                  text: " copied 📋",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showMailWithOpacity(bool shouldShow) {
    setState(() {
      _mailOpacity = shouldShow ? 1 : 0;
    });
  }

  void _showCopyClipboardWithOpacity(bool shouldShow) {
    setState(() {
      _copyClipboardOpacity = shouldShow ? 1 : 0;
    });
  }
}
