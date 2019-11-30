import 'package:desing_map/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class PageOffsetNotifier with ChangeNotifier {
  double _offset = 0;
  double _page = 0;

  PageOffsetNotifier(PageController pageController) {
    pageController.addListener(() {
      _offset = pageController.offset;
      _page = pageController.page;
      notifyListeners();
    });
  }

  double get offset => _offset;
  double get page => _page;
}

class MainPage extends StatelessWidget {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (_) => PageOffsetNotifier(_pageController),
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: <Widget>[
              PageView(
                controller: _pageController,
                physics: ClampingScrollPhysics(),
                children: <Widget>[
                  LeopardPage(),
                  VulturePage(),
                ],
              ),
              AppBar(),
              LeopardImage(),
              VultureImage(),
              ShareButton(),
              PageIndicator(),
              ArrowUp(),
            ],
          ),
        ),
      ),
    );
  }
}

class LeopardImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
          left: (-0.85 * notifier.offset),
          width: MediaQuery.of(context).size.width * 1.6,
          child: child,
        );
      },
      child: IgnorePointer(
        child: Image.asset('assets/leopard.png'),
      ),
    );
  }
}

class VultureImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
          left: (1.2 * MediaQuery.of(context).size.width -
              0.85 * notifier.offset),
          height: MediaQuery.of(context).size.height / 2.7,
          child: child,
        );
      },
      child: IgnorePointer(
        child: Image.asset('assets/vulture.png'),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: <Widget>[
            Text(
              'sy'.toUpperCase(),
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Icon(
              Icons.menu,
            ),
          ],
        ),
      ),
    );
  }
}

class The72Text extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Transform.translate(
          offset: Offset((-32 - 0.5 * notifier.offset), 0),
          child: child,
        );
      },
      child: Transform.translate(
        offset: Offset(-30, 0),
        child: Container(
          alignment: Alignment.topLeft,
          child: RotatedBox(
            quarterTurns: 1,
            child: Text(
              '72',
              style: TextStyle(
                fontSize: 350,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
    // return Image.asset('assets/leopard.png');
  }
}

class VulturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LeopardPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 80,
        ),
        The72Text(),
        SizedBox(
          height: 30,
        ),
        TravelDescriptionLabel(),
        SizedBox(
          height: 30,
        ),
        LeopardDescription(),
      ],
    );
  }
}

class TravelDescriptionLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0),
      child: Consumer<PageOffsetNotifier>(
        builder: (context, notifier, child) {
          return Opacity(
            opacity: math.max(0, 1 - 4 * notifier.page),
            child: child,
          );
        },
        child: Text(
          'Leopardo Descrição',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

class LeopardDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Consumer<PageOffsetNotifier>(
        builder: (context, notifier, child) {
          return Opacity(
            opacity: math.max(0, 1 - 4 * notifier.page),
            child: child,
          );
        },
        child: Text(
          'O leopardo é bixo muito sagaz, cassador de gente e vive na amazonia. Muitos caçadores tentam pegarr esse trem, mas acaba morrendo pois o bixo muito doido e rapidão moro.',
          style: TextStyle(
            color: lightGray,
          ),
        ),
      ),
    );
  }
}

class ShareButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 16,
      right: 24,
      child: Icon(Icons.share),
    );
  }
}

class PageIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, _) {
        return Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (notifier.page.round() == 0) ? white : lightGray,
                  ),
                  width: 6,
                  height: 6,
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (notifier.page.round() != 0) ? white : lightGray,
                  ),
                  width: 6,
                  height: 6,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class ArrowUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: (128.0 + 350 + 20),
      right: 24,
      child: Icon(
        Icons.keyboard_arrow_up,
        size: 28,
        color: lightGray,
      ),
    );
  }
}
