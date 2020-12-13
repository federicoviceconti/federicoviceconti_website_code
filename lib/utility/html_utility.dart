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

  static void printAsciiArt() {
    print(''' 
-oooooooo/-      .+ooooooooo:  +ooo+        oooo/
+MMMMMMMMMMm+   -NMMMMMMMMMMs  +MMMM:      /MMMM/
+MMMNyyydMMMMy  /MMMMyyyyyyy/   mMMMd      mMMMd
+MMMm    :MMMM. /MMMN           /MMMM/    /MMMM:
+MMMm    .MMMM- /MMMN            dMMMm    mMMMh
+MMMm    .MMMM- /MMMMyyyy+       :MMMM/  +MMMM-
+MMMm    .MMMM- /MMMMMMMMy        hMMMm  NMMMy
+MMMm    .MMMM- /MMMMoooo:        -MMMM+oMMMM-
+MMMm    .MMMM- /MMMN              yMMMmNMMMy
+MMMm    +MMMM. /MMMN              .MMMMMMMM.
+MMMMdddNMMMMo  /MMMMddddddd+       sMMMMMMs
+MMMMMMMMMNh:   .mMMMMMMMMMMs        yMMMMs
.///////:-        -/////////-         .::.

Hi! I'm Federico. SW Dev from Italy. I hope you're well :)
If you want, you can contact me on the mail on the bottom.

I put a secret easter egg. Will you found it? Enjoy :D
''');
  }
}
