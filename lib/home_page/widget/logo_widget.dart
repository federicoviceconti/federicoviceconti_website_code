import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  final Function() onLogoTap;

  LogoWidget({this.onLogoTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onLogoTap != null
          ? () {
              onLogoTap.call();
            }
          : () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          border: Border.all(
              color: Theme.of(context).colorScheme.primary,
              style: BorderStyle.solid,
              width: 2),
        ),
        child: Text(
          'FV',
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontWeight: FontWeight.normal,
                fontSize: 26,
              ),
        ),
      ),
    );
  }
}