import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageHelper {
  static Widget getPng(String imageUrl, {double? width, BoxFit? fit}) {
    return Image.asset(
      'assets/png/$imageUrl.png',
      width: width,
      fit: fit ?? BoxFit.cover,
    );
  }

  static Widget getSvg(
    String name, {
    double? width,
    BoxFit? fit,
    Color? color,
  }) {
    if (color != null) {
      return SvgPicture.asset(
        'assets/svg/$name.svg',
        width: width,
        fit: fit ?? BoxFit.cover,
        theme: SvgTheme(currentColor: color),
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.screen,
        ),
      );
    }

    return SvgPicture.asset(
      'assets/svg/$name.svg',
      width: width,
      fit: fit ?? BoxFit.cover,
    );
  }
}
