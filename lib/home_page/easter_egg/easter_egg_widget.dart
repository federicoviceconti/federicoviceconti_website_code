import 'package:federicoviceconti_github_io/home_page/widget/logo_widget.dart';
import 'package:flutter/material.dart';

class EasterEggWidget extends StatefulWidget {
  @override
  _EasterEggWidgetState createState() => _EasterEggWidgetState();
}

class _EasterEggWidgetState extends State<EasterEggWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 28.0,
          left: 28.0,
          child: LogoWidget(),
        ),
      ],
    );
  }
}
