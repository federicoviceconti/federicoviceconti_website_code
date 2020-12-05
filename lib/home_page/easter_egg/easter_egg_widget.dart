import 'dart:async';

import 'package:federicoviceconti_github_io/home_page/widget/logo_widget.dart';
import 'package:flutter/material.dart';

class EasterEggWidget extends StatefulWidget {
  final Function() onLogoTap;

  EasterEggWidget({
    this.onLogoTap,
  });

  @override
  _EasterEggWidgetState createState() => _EasterEggWidgetState();
}

class _EasterEggWidgetState extends State<EasterEggWidget> with WidgetsBindingObserver {
  double _top = 28;
  double _left = 28;
  Timer _timerMovement;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final maxHeightScreen = MediaQuery.of(context).size.height - 40;
      final maxWidthScreen = MediaQuery.of(context).size.width - 40;

      int incrementTop = 1;
      int incrementLeft = 1;

      _timerMovement = Timer.periodic(Duration(milliseconds: 10), (timer) { 
        if(_top == maxHeightScreen || _top <= 0) {
          incrementTop = -incrementTop;
        }

        if(_left == maxWidthScreen || _left <= 0) {
          incrementLeft = -incrementLeft;
        }

        setState(() {
          _top = _top + incrementTop;
          _left = _left + incrementLeft;
        });
      });
    });
  }

  @override
  void dispose() {
    _timerMovement?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: _top,
          left: _left,
          child: LogoWidget(
            onLogoTap: () {
              widget.onLogoTap?.call();
            },
          ),
        ),
      ],
    );
  }
}
