import 'package:federicoviceconti_github_io/home_page/widget/cursor_widget.dart';
import 'package:federicoviceconti_github_io/notifier/app_theme_notifier.dart';
import 'package:federicoviceconti_github_io/utility/firebase_analytics_helper.dart';
import 'package:federicoviceconti_github_io/utility/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsWidget extends StatefulWidget {
  const ContactsWidget({Key? key}) : super(key: key);

  @override
  _ContactsWidgetState createState() => _ContactsWidgetState();
}

class _ContactsWidgetState extends State<ContactsWidget> {
  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Text(
              'Contacts',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 16.0,
            ),
            child: Text(
              'Hi, thanks for visiting my personal website! If you want to reach me out, please use the following contacts:',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                fontWeight: FontWeight.w300,
                fontSize: 18,
              ),
            ),
          ),
          _buildRowWithData('mail', 'Mail', 'viceconti.federico@gmail.com', () {
            FirebaseAnalyticsHelper()
                .logEvent(name: FirebaseAnalyticsHelper.EMAIL_CONTACTS);
            launch('mailto:viceconti.federico@gmail.com');
          }),
          SizedBox(height: 20),
          _buildRowWithData('github', 'Github', '@federicoviceconti', () {
            FirebaseAnalyticsHelper()
                .logEvent(name: FirebaseAnalyticsHelper.GITHUB_CONTACTS);
            launch('https://github.com/federicoviceconti');
          }),
          SizedBox(height: 20),
          _buildRowWithData('linkedin', 'LinkedIn', '/federicoviceconti', () {
            FirebaseAnalyticsHelper()
                .logEvent(name: FirebaseAnalyticsHelper.LINKEDIN_CONTACTS);
            launch('https://www.linkedin.com/in/federicoviceconti/');
          }),
        ],
      ),
    );
  }

  Widget _buildRowWithData(String imageSrcSvg, String title, String subtitle, Null Function() action) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(
        top: 40.0,
      ),
      child: CursorWidget(
        child: GestureDetector(
          onTap: () => action.call(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16),
                child: Row(
                  children: [
                    Consumer<AppThemeNotifier>(
                      builder: (_, notifier, __) {
                        return ImageHelper.getSvg(
                            imageSrcSvg,
                            width: 50,
                            color: notifier.isDark ? Colors.white : Colors.black
                        );
                      },
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .headline4!
                              .copyWith(fontSize: 26.0, fontWeight: FontWeight.w700),
                        ),
                        Text(
                          subtitle,
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(fontSize: width > 400 ? 14.0 : 12.0),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.only(
                  left: 16.0,
                  bottom: 6.0,
                ),
                height: 0.1,
                color: Theme.of(context).colorScheme.primary,
              )
            ],
          ),
        ),
      ),
    );
  }
}
