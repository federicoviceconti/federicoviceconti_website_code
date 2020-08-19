import 'package:federicoviceconti_github_io/core/base_widget.dart';
import 'package:federicoviceconti_github_io/notifier/app_theme_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  double _mailOpacity = 1.0;
  double _copyClipboardOpacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return BaseWidget(child: _buildBody());
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          _buildWhoAmI(),
          _buildMail(),
          _buildCopiedText(),
          _buildSwitchTheme(),
        ],
      ),
    );
  }

  Widget _buildWhoAmI() {
    final screenSize = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20.0),
      width: screenSize.width,
      height: screenSize.height,
      child: _buildWelcomeText(),
    );
  }

  Widget _buildWelcomeText() {
    final welcomeText =
        "Hello, I'm Federico!\nAndroid developer, Flutter enthusiast.\nFrom Rome, 🇮🇹";

    return Text(welcomeText, style: Theme.of(context).textTheme.headline4);
  }

  Widget _buildMail() {
    final screenSize = MediaQuery.of(context).size;

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

  Widget _buildCopiedText() {
    final screenSize = MediaQuery.of(context).size;

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
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontWeight: FontWeight.bold),
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
