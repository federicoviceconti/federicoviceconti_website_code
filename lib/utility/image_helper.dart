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

  static getSvg(String name, {double? width, BoxFit? fit, Color? color}) {
    return SvgPicture.asset(
      'assets/svg/$name.svg',
      width: width,
      fit: fit ?? BoxFit.cover,
      color: color,
      colorBlendMode: BlendMode.screen,
    );
  }
}