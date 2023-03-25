import 'package:federicoviceconti_github_io/home_page/widget/cursor_widget.dart';
import 'package:federicoviceconti_github_io/utility/firebase_analytics_helper.dart';
import 'package:federicoviceconti_github_io/utility/image_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildContactHeadlineTitle(),
              _buildContactHeading(),
              _buildRowWithData('mail', 'Mail', 'viceconti.federico@gmail.com', () {
                FirebaseAnalyticsHelper()
                    .logEvent(name: FirebaseAnalyticsHelper.EMAIL_CONTACTS);
                launchUrlString('mailto:viceconti.federico@gmail.com');
              }),
              SizedBox(height: 20),
              _buildRowWithData('github', 'Github', '@federicoviceconti', () {
                FirebaseAnalyticsHelper()
                    .logEvent(name: FirebaseAnalyticsHelper.GITHUB_CONTACTS);
                launchUrlString('https://github.com/federicoviceconti');
              },),
              SizedBox(height: 20),
              _buildRowWithData('linkedin', 'LinkedIn', '/federicoviceconti', () {
                FirebaseAnalyticsHelper()
                    .logEvent(name: FirebaseAnalyticsHelper.LINKEDIN_CONTACTS);
                launchUrlString('https://www.linkedin.com/in/federicoviceconti/');
              }),
              SizedBox(height: 20),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.background,
                  blurRadius: 4,
                  spreadRadius: 4,
                )
              ]
            ),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                  AppLocalizations.of(context)!.websiteMadeWith("❤️"),
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 14)
              ),
            ),
          ),
        )
      ],
    );
  }

  Padding _buildContactHeadlineTitle() {
    return Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Text(
                AppLocalizations.of(context)!.contacts,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            );
  }

  Padding _buildContactHeading() {
    return Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
              ),
              child: Text(
                AppLocalizations.of(context)!.contactsHeading,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                ),
              ),
            );
  }

  Widget _buildRowWithData(String imageSrcSvg, String title, String subtitle, Null Function() action) {
    final width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(
        top: 20.0,
      ),
      child: CursorWidget(
        child: GestureDetector(
          onTap: () => action.call(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontSize: 26.0, fontWeight: FontWeight.w700),
                      ),
                      Text(
                        subtitle,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: width > 400 ? 14.0 : 12.0),
                      ),
                    ],
                  ),
                  Spacer(),
                  ImageHelper.getSvg(
                    imageSrcSvg,
                    width: 50,
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                margin: const EdgeInsets.only(
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
