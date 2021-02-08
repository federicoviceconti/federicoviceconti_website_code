import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeadingText(),
                _buildSubHeadingText(),
                _buildExperienceSection(),
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
        AppLocalizations.of(context).aboutMe,
        style: Theme.of(context).textTheme.headline4.copyWith(
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
        AppLocalizations.of(context).aboutMeSubtitle,
        style: Theme.of(context).textTheme.headline4.copyWith(
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
                .headline4
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

  _buildSectionContent({String header, String content}) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            header,
            style: Theme.of(context).textTheme.headline4.copyWith(
                  fontSize: 20.0,
                ),
          ),
          _buildContent(content)
        ],
      ),
    );
  }

  Widget _buildContent(String content) {
    return content != null && content.isNotEmpty
        ? Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              content ?? '',
              style: Theme.of(context).textTheme.bodyText1.copyWith(
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
        _buildHeadingSectionWithLine(AppLocalizations.of(context).experience),
        _buildSectionContent(
          header: AppLocalizations.of(context).nttExperienceTitle,
          content: AppLocalizations.of(context).nttExperienceContent,
        ),
        _buildSectionContent(
          header: AppLocalizations.of(context).vetryaExperienceTitle,
          content: AppLocalizations.of(context).vetryaExperienceContent,
        ),
      ],
    );
  }

  _buildEducationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeadingSectionWithLine(AppLocalizations.of(context).education),
        _buildSectionContent(
          header: AppLocalizations.of(context).elisCollegeEducationTitle,
          content: AppLocalizations.of(context).elisCollegeEducationContent,
        ),
        _buildSectionContent(
          header: AppLocalizations.of(context).universityEducationTitle,
          content: AppLocalizations.of(context).universityEducationContent,
        ),
      ],
    );
  }

  _buildCertificationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeadingSectionWithLine(AppLocalizations.of(context).certification),
        _buildSectionContent(
          header: AppLocalizations.of(context).certificationAndroid,
        ),
        _buildSectionContent(
          header: AppLocalizations.of(context).certificationTOEFL,
        ),
        _buildSectionContent(
          header: AppLocalizations.of(context).certificationOCP,
        ),
        _buildSectionContent(
          header: AppLocalizations.of(context).certificationOCA,
        ),
      ],
    );
  }
}
