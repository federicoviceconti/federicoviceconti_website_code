import 'package:flutter/foundation.dart';

class HtmlUtility {
  static bool isMobile() {
    return kIsWeb &&
        (defaultTargetPlatform == TargetPlatform.iOS ||
            defaultTargetPlatform == TargetPlatform.android);
  }

  static void printAsciiArt() {
    print(''' 
Hi! I'm Federico. SW Dev from Italy. I hope you're well :)
If you want, you can contact me on the mail on the bottom.

I put a secret easter egg. Will you found it? Enjoy :D
''');
  }
}
