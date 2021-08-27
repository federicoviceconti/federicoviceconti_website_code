import 'package:federicoviceconti_github_io/core/full_screen_widget.dart';
import 'package:federicoviceconti_github_io/home_page/widget/cursor_widget.dart';
import 'package:federicoviceconti_github_io/utility/firebase_analytics_helper.dart';
import 'package:flutter/material.dart';
import 'package:federicoviceconti_github_io/utility/proportion.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WhoAmIWidget extends StatefulWidget {
  @override
  _WhoAmIWidgetState createState() => _WhoAmIWidgetState();
}

class _WhoAmIWidgetState extends State<WhoAmIWidget> {
  double _mailOpacity = 1.0;
  double _copyClipboardOpacity = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildWhoAmI(),
        _buildMail(),
        _buildCopiedText(),
      ],
    );
  }

  Widget _buildWhoAmI() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildWelcomeText(32),
        ],
      ),
    );
  }

  Widget _buildWelcomeText(double fontSize) {
    final welcomeText = AppLocalizations.of(context)!.helloIAm;

    return Text(
      welcomeText,
      style: Theme.of(context).textTheme.headline4!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: Proportion.getProportionalValueOnLongSize(
              context,
              fontSize,
            ),
          ),
    );
  }

  Widget _buildMail() {
    return AnimatedOpacity(
      opacity: _mailOpacity,
      duration: Duration(milliseconds: 100),
      child: Container(
        padding: const EdgeInsets.only(bottom: 20.0),
        alignment: Alignment.bottomLeft,
        child: GestureDetector(
          onTap: _onTapMail,
          child: CursorWidget(
            child: Text(
              AppLocalizations.of(context)!.sayHelloToMail,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    height: 1.5,
                  ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTapMail() {
    FirebaseAnalyticsHelper()
        .logEvent(name: FirebaseAnalyticsHelper.MAIL_HOME_TAP);

    Clipboard.setData(ClipboardData(text: AppLocalizations.of(context)!.mail));

    _showMailWithOpacity(false);
    _showCopyClipboardWithOpacity(true);

    Future.delayed(Duration(seconds: 3), () {
      _showMailWithOpacity(true);
      _showCopyClipboardWithOpacity(false);
    });
  }

  Widget _buildCopiedText() {
    return AnimatedPositioned(
      bottom: _copyClipboardOpacity == 1 ? 0 : -30,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeIn,
      child: AnimatedOpacity(
        opacity: _copyClipboardOpacity,
        duration: Duration(milliseconds: 300),
        child: FullScreenWidget(
          padding: const EdgeInsets.only(bottom: 20.0),
          alignment: Alignment.bottomLeft,
          child: RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              text: AppLocalizations.of(context)!.mail,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              children: [
                TextSpan(
                  text: AppLocalizations.of(context)!.copiedWithEmoji,
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
