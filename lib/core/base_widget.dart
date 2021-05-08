import 'package:flutter/material.dart';

class BaseWidget extends StatefulWidget {
  final Widget child;
  final Widget? header;

  const BaseWidget({Key? key, required this.child, this.header}) : super(key: key);

  @override
  BaseWidgetState createState() => BaseWidgetState();
}

class BaseWidgetState extends State<BaseWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          widget.header ?? Container(),
          Expanded(
            child: widget.child,
          )
        ],
      ),
    );
  }
}