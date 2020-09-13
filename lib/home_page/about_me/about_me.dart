import 'package:flutter/material.dart';

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
        'About me',
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
        'Passionate developer, who never stop learn since I start.',
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
        _buildHeadingSectionWithLine('Experience'),
        _buildSectionContent(
          header: 'Mobile Developer @ NTT Data Italia',
          content: '''Working in Mobile&Creative Technology. Clients: Enel X, Poste Italiane.
Apps developed: JuicePass, YoUrban, ForFriends, NoiDiPoste
Technologies & Tools: Flutter, Android w/ Java, Xamarin, Git, Jenkins, Jira''',
        ),
        _buildSectionContent(
          header: 'Software developer @ Vetrya S.p.A.',
          content: '''Projects: Vision app, Vilast, Corporate Campus App
Technologies & Tools: Android w/ Java, React.Js, React Native''',
        ),
      ],
    );
  }

  _buildEducationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeadingSectionWithLine('Education'),
        _buildSectionContent(
          header: 'Post degree master @ ELIS College',
          content: '''Thesis topic: Developing a web app with React.js and .NET infrastructure.
Main subjects: Java SE 8, Java EE, Front-end and back-end frameworks, Mobile, Adobe Suite, UML and design patterns.''',
        ),
        _buildSectionContent(
          header: 'Computer Engineering Degree @ Uninettuno University',
          content: '''Main subjects: calculus, linear algebra, computer architecture, fundamentals of computer programming, structured and object-oriented programming, software engineering''',
        ),
      ],
    );
  }

  _buildCertificationSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeadingSectionWithLine('Certification'),
        _buildSectionContent(
          header: 'Associate Android Developer, Google / Udacity',
        ),
        _buildSectionContent(
          header: 'TOEFL iBT',
        ),
        _buildSectionContent(
          header: 'OCP Java SE 8, Oracle',
        ),
        _buildSectionContent(
          header: 'OCA Java SE 8, Oracle',
        ),
      ],
    );
  }
}
