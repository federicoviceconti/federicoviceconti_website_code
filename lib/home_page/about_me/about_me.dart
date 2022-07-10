import 'package:federicoviceconti_github_io/home_page/widget/cursor_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

import 'link_text.dart';

class AboutMeWidget extends StatefulWidget {
  @override
  AboutMeWidgetState createState() => AboutMeWidgetState();
}

class AboutMeWidgetState extends State<AboutMeWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeadingText(),
                _buildSubHeadingText(),
                _buildExperienceSection(),
                _buildProjectSection(),
                _buildEducationSection(),
                _buildCertificationSection(),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeadingText() {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: Text(
        AppLocalizations.of(context)!.aboutMe,
        style: Theme.of(context).textTheme.headline4!.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 32,
        ),
      ),
    );
  }

  Widget _buildSubHeadingText() {
    return Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
      ),
      child: Text(
        AppLocalizations.of(context)!.aboutMeSubtitle,
        style: Theme.of(context).textTheme.headline4!.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: 18,
        ),
      ),
    );
  }

  Widget _buildHeadingSectionWithLine(String headText) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 40.0,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            headText,
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(fontSize: 26.0, fontWeight: FontWeight.w700),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                left: 16.0,
                bottom: 6.0,
              ),
              height: 0.1,
              color: Theme.of(context).colorScheme.primary,
            ),
          )
        ],
      ),
    );
  }

  _buildSectionContent({
    String? header,
    String? content,
    String? year,
    LinkText? linkText,
  }) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header ?? '',
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  fontSize: 20.0,
                ),
          ),
          SizedBox(height: 4),
          _buildYearOrEmpty(year),
          _buildContent(content ?? ''),
          linkText != null ? _buildLink(linkText) : IgnorePointer(),
        ],
      ),
    );
  }

  Widget _buildContent(String content) {
    return content.isNotEmpty
        ? Padding(
      padding: const EdgeInsets.only(top: 4.0),
      child: Text(
        content,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 14.0,
                  ),
            ),
    )
        : SizedBox();
  }

  _buildExperienceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeadingSectionWithLine(AppLocalizations.of(context)!.experience),
        _buildSectionContent(
          header: AppLocalizations.of(context)!.windExperienceTitle,
          content: AppLocalizations.of(context)!.windExperienceContent,
          year: "Jun 2022 - Present",
        ),
        _buildSectionContent(
          header: AppLocalizations.of(context)!.nttExperienceTitle,
          content: AppLocalizations.of(context)!.nttExperienceContent,
          year: "Jul 2018 -  Jun 2022",
        ),
        _buildSectionContent(
          header: AppLocalizations.of(context)!.vetryaExperienceTitle,
          content: AppLocalizations.of(context)!.vetryaExperienceContent,
          year: "Mar 2017 - Jul 2018",
        ),
      ],
    );
  }

  _buildProjectSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeadingSectionWithLine(
            AppLocalizations.of(context)!.sideProjects),
        _buildSectionContent(
          header: "card_stack_widget (Flutter/Dart)",
          content: AppLocalizations.of(context)!.projectCardStackDescription,
          linkText: LinkText(
            text: 'pub.dev/card_stack_widget',
            link: 'https://pub.dev/packages/card_stack_widget',
          ),
        ),
        _buildSectionContent(
          header: "unofficial_twitch_open_api (Flutter/Dart)",
          content: AppLocalizations.of(context)!.projectTwitchDescription,
          linkText: LinkText(
            text: 'pub.dev/unofficial_twitch_open_api',
            link: 'https://pub.dev/packages/unofficial_twitch_open_api',
          ),
        ),
        _buildSectionContent(
          header: "flutter_slider (Flutter/Dart)",
          content: AppLocalizations.of(context)!.projectSliderDescription,
          linkText: LinkText(
            text: 'github/flutter_slider',
            link: 'https://github.com/federicoviceconti/flutter_slider',
          ),
        ),
        _buildSectionContent(
          header: "covid_bot (Flutter/Dart)",
          content: AppLocalizations.of(context)!.projectCovidBotDescription,
          linkText: LinkText(
            text: 'github/covid_bot',
            link: 'https://github.com/federicoviceconti/covid_bot',
          ),
        ),
        _buildSectionContent(
          header: "jouney_demo (Flutter/Dart)",
          content: AppLocalizations.of(context)!.projectJourneyDemoDescription,
          linkText: LinkText(
            text: 'github/jouney_demo',
            link: 'https://github.com/federicoviceconti/Journey-Demo',
          ),
        ),
      ],
    );
  }

  _buildEducationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeadingSectionWithLine(AppLocalizations.of(context)!.education),
        _buildSectionContent(
          header: AppLocalizations.of(context)!.elisCollegeEducationTitle,
          content: AppLocalizations.of(context)!.elisCollegeEducationContent,
        ),
        _buildSectionContent(
          header: AppLocalizations.of(context)!.universityEducationTitle,
          content: AppLocalizations.of(context)!.universityEducationContent,
        ),
      ],
    );
  }

  _buildCertificationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeadingSectionWithLine(AppLocalizations.of(context)!.certification),
        _buildSectionContent(
          header: AppLocalizations.of(context)!.certificationAndroid,
        ),
        _buildSectionContent(
          header: AppLocalizations.of(context)!.certificationTOEFL,
        ),
        _buildSectionContent(
          header: AppLocalizations.of(context)!.certificationOCP,
        ),
        _buildSectionContent(
          header: AppLocalizations.of(context)!.certificationOCA,
        ),
      ],
    );
  }

  Widget _buildYearOrEmpty(String? year) {
    if(year == null || year.isEmpty) return Container();

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '($year)',
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontSize: 12.0,
              ),
        ),
        SizedBox(height: 6),
      ],
    );
  }

  Widget _buildLink(LinkText linkText) {
    return GestureDetector(
      onTap: () async {
        if (await canLaunch(linkText.link)) {
          launch(linkText.link);
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: CursorWidget(
          child: Text(
            'Link ${linkText.text}',
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ),
    );
  }
}
