import 'package:federicoviceconti_github_io/core/base_widget.dart';
import 'package:federicoviceconti_github_io/core/shape_painter.dart';
import 'package:federicoviceconti_github_io/notifier/app_theme_notifier.dart';
import 'package:federicoviceconti_github_io/utility/proportion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  double _mailOpacity = 1.0;
  double _copyClipboardOpacity = 0.0;
  bool defaultPosition = true;
  double localX = 0.0;
  double localY = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWidget(child: _buildBody());
  }

  Widget _buildBody() {
    final screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: MouseRegion(
        onEnter: (_) => setState(() => defaultPosition = false),
        onExit: (_) => setState(() {
          localY = (screenSize.height) / 2;
          localX = (screenSize.width * 0.45) / 2;
          defaultPosition = true;
        }),
        onHover: (details) {
          if (details.localPosition.dx > 0 && details.localPosition.dy > 0) {
            if (details.localPosition.dx < (screenSize.width * 0.45) * 2.5 &&
                details.localPosition.dy > 0) {
              setState(() {
                localX = details.localPosition.dx;
                localY = details.localPosition.dy;
              });
            }
          }
        },
        child: Stack(
          children: [
            _buildBackground(screenSize),
            _buildWhoAmI(screenSize),
            _buildMail(screenSize),
            _buildCopiedText(screenSize),
            _buildSwitchTheme(),
          ],
        ),
      ),
    );
  }

  Widget _buildBackground(Size screenSize) {
    double percentageX = _getPercentageX(screenSize);
    double percentageY = _getPercentageY(screenSize);
    return _buildTransform(screenSize, percentageX, percentageY);
  }

  _buildTransform(Size screenSize, double percentageX, double percentageY) {
    List<List<double>> triangleCoordinates = [
      [
        Proportion.getProportionalWidth(context, 100),
        Proportion.getProportionalHeight(context, 100)
      ],
      [
        Proportion.getProportionalWidth(context, 200),
        Proportion.getProportionalHeight(context, 800)
      ],
      [
        Proportion.getProportionalWidth(context, 300),
        Proportion.getProportionalHeight(context, 200)
      ],
      [
        Proportion.getProportionalWidth(context, 400),
        Proportion.getProportionalHeight(context, 650)
      ],
      [
        Proportion.getProportionalWidth(context, 600),
        Proportion.getProportionalHeight(context, 750)
      ],
      [
        Proportion.getProportionalWidth(context, 700),
        Proportion.getProportionalHeight(context, 200)
      ],
      [
        Proportion.getProportionalWidth(context, 900),
        Proportion.getProportionalHeight(context, 850)
      ]
    ];

    return Transform(
      transform: Matrix4.identity()
        ..translate(
          defaultPosition ? 0.0 : (70 * (percentageX / 50) + -70),
          defaultPosition ? 0.0 : (80 * (percentageY / 50) + -80),
          0.0,
        )
        ..rotateY(percentageY / 150)
        ..rotateX(percentageX / 150),
      alignment: FractionalOffset.center,
      child: Container(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
          children: _positionTriangleWithCoordinates(triangleCoordinates),
        ),
      ),
    );
  }

  _getPercentageX(Size screenSize) {
    final percentageX = (localX / (screenSize.width)) * 100;
    return percentageX;
  }

  _getPercentageY(Size screenSize) {
    final percentageY = (localY / screenSize.height) * 100;
    return percentageY;
  }

  List<Widget> _positionTriangleWithCoordinates(
      List<List<double>> coordinates) {
    return Iterable<int>.generate(coordinates.length).toList().map((index) {
      final x = coordinates[index][0];
      final y = coordinates[index][1];

      return Stack(
        children: [
          _buildShadowShape(x, y),
          Positioned(
            left: x,
            top: y,
            child: CustomPaint(
              painter: ShapePainter(
                  shapeType: _getShapeType(index),
                  color: Colors.grey,
                  style: index % 3 == 0
                      ? PaintingStyle.stroke
                      : PaintingStyle.fill),
              size: Size(10, 10),
            ),
          ),
        ],
      );
    }).toList();
  }

  ShapePainterType _getShapeType(int index) {
    if (index % 2 == 0) {
      return ShapePainterType.square;
    } else if (index % 3 == 0) {
      return ShapePainterType.circle;
    }

    return ShapePainterType.triangle;
  }

  Widget _buildShadowShape(double x, double y) {
    return Consumer<AppThemeNotifier>(
      builder: (context, appThemeNotifier, child) {
        return appThemeNotifier.currentAppTheme == ThemeMode.dark
            ? Positioned(
                left: x,
                top: y,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        blurRadius: 16.0,
                        color: Colors.white.withOpacity(0.3),
                        spreadRadius: 4.0)
                  ]),
                ),
              )
            : Container();
      },
    );
  }

  Widget _buildWhoAmI(Size screenSize) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.only(left: 20.0),
      width: screenSize.width,
      height: screenSize.height,
      child: _buildWelcomeText(32),
    );
  }

  Widget _buildWelcomeText(double fontSize) {
    final welcomeText =
        "Hello, I'm Federico!\nAndroid developer, Flutter enthusiast.\nFrom Rome, 🇮🇹";

    return Text(
      welcomeText,
      style: Theme.of(context).textTheme.headline4.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: Proportion.getProportionalValueOnLongSize(
              context,
              fontSize,
            ),
          ),
    );
  }

  Widget _buildMail(Size screenSize) {
    return AnimatedOpacity(
      opacity: _mailOpacity,
      duration: Duration(milliseconds: 100),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: screenSize.width,
        height: screenSize.height,
        alignment: Alignment.bottomLeft,
        child: GestureDetector(
          onTap: _onTapMail,
          child: Text(
            "Say hello to viceconti.federico@gmail.com 👋",
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
      ),
    );
  }

  Widget _buildSwitchTheme() {
    final screenSize = MediaQuery.of(context).size;

    return Container(
        padding: const EdgeInsets.all(32.0),
        width: screenSize.width,
        height: screenSize.height,
        alignment: Alignment.topRight,
        child: IconButton(
          color: Theme.of(context).iconTheme.color,
          onPressed: _onSwitchThemePress,
          icon: Icon(Icons.brightness_4),
        ));
  }

  void _onSwitchThemePress() {
    Provider.of<AppThemeNotifier>(context, listen: false).switchAppTheme();
  }

  void _onTapMail() {
    Clipboard.setData(ClipboardData(text: "viceconti.federico@gmail.com"));

    _showMailWithOpacity(false);
    _showCopyClipboardWithOpacity(true);

    Future.delayed(Duration(seconds: 3), () {
      _showMailWithOpacity(true);
      _showCopyClipboardWithOpacity(false);
    });
  }

  Widget _buildCopiedText(Size screenSize) {
    return AnimatedPositioned(
      bottom: _copyClipboardOpacity == 1 ? 0 : -30,
      duration: Duration(milliseconds: 100),
      curve: Curves.easeIn,
      child: AnimatedOpacity(
        opacity: _copyClipboardOpacity,
        duration: Duration(milliseconds: 300),
        child: Container(
          padding: const EdgeInsets.all(20.0),
          width: screenSize.width,
          height: screenSize.height,
          alignment: Alignment.bottomRight,
          child: RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              text: "viceconti.federico@gmail.com",
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              children: [
                TextSpan(
                  text: " copied 📋",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showMailWithOpacity(bool shouldShow) {
    setState(() {
      _mailOpacity = shouldShow ? 1 : 0;
    });
  }

  void _showCopyClipboardWithOpacity(bool shouldShow) {
    setState(() {
      _copyClipboardOpacity = shouldShow ? 1 : 0;
    });
  }
}
