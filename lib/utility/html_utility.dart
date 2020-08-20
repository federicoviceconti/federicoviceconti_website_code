// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

class HtmlUtility {
  static bool isMobile() {
    try {
      final userAgent = window.navigator.userAgent;
      final hasMobileAgent = [
        'iphone',
        'ipad',
        'android',
        'blackberry',
        'nokia',
        'opera mini',
        'windows mobile',
        'windows phone',
        'iemobile'
      ].firstWhere((element) => userAgent.toLowerCase().contains(element), orElse: () => '').isNotEmpty;
      return hasMobileAgent;
    } catch (e) {
      return false;
    }
  }
}
