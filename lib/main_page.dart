import 'package:desing_map/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'leopart_page.dart';

class PageOffsetNotifier with ChangeNotifier {
  double _offset = 0;
  double _page = 0;

  PageOffsetNotifier(PageController pageController) {
    pageController.addListener(() {
      _offset = pageController.offset;
      _page = pageController.page;
      // print(_offset);
      // print(_page);
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
              TravelDatailsLabel(),
              StartCampLabel(),
              StartTimeLabel(),
              BaseCampLabel(),
              BaseTimeLabel(),
              DistanceLabel(),
              TravelDots(),
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
            padding: const EdgeInsets.only(bottom: 25),
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
      top: (128.0 + 300 + 20),
      right: 24,
      child: Icon(
        Icons.keyboard_arrow_up,
        size: 28,
        color: lightGray,
      ),
    );
  }
}

class VulturePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class TravelDatailsLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
          top: 128.0 + 300 + 20,
          left: 24 + MediaQuery.of(context).size.width - notifier.offset,
          // child: child,
          child: Opacity(
            opacity: math.max(0, 4 * notifier.page - 3),
            child: child,
          ),
        );
      },
      child: Text(
        'Abutre Detalhes',
        style: TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}

class StartCampLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
          width: (MediaQuery.of(context).size.width - 48) / 3,
          top: 128.0 + 300 + 20 + 24 + 30,
          left: math.max(0, 4 * notifier.page - 3) * 24.0,
          child: Opacity(
            opacity: math.max(0, 4 * notifier.page - 3),
            child: child,
          ),
        );
      },
      child: Center(
        child: Text(
          'Start Camp',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}

class StartTimeLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
          width: (MediaQuery.of(context).size.width - 48) / 3,
          top: 128.0 + 300 + 20 + 24 + 30 + 30,
          left: math.max(0, 4 * notifier.page - 3) * 24.0,
          child: Opacity(
            opacity: math.max(0, 4 * notifier.page - 3),
            child: child,
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          '02:40 pm',
          style: TextStyle(
            fontSize: 14,
            color: lightGray,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}

class BaseCampLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
          width: (MediaQuery.of(context).size.width - 48) / 3,
          top: 128.0 + 300 + 20 + 24 + 30,
          right: math.max(0, 4 * notifier.page - 3) * 24.0,
          child: Opacity(
            opacity: math.max(0, 4 * notifier.page - 3),
            child: child,
          ),
        );
      },
      child: Center(
        child: Text(
          'Base Camp',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}

class BaseTimeLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
          width: (MediaQuery.of(context).size.width - 48) / 3,
          top: 128.0 + 300 + 20 + 24 + 30 + 30,
          right: math.max(0, 4 * notifier.page - 3) * 24.0,
          child: Opacity(
            opacity: math.max(0, 4 * notifier.page - 3),
            child: child,
          ),
        );
      },
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '07:30 am',
          style: TextStyle(
            fontSize: 14,
            color: lightGray,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}

class DistanceLabel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        return Positioned(
          width: MediaQuery.of(context).size.width,
          top: 128.0 + 300 + 20 + 24 + 30 + 30,
          child: Opacity(
            opacity: math.max(0, 4 * notifier.page - 3),
            child: child,
          ),
        );
      },
      child: Center(
        child: Text(
          '72 km',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class TravelDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PageOffsetNotifier>(
      builder: (context, notifier, child) {
        double opacity = math.max(0, 4 * notifier.page - 3);
        return Positioned(
          top: 128.0 + 300 + 20 + 24 + 30,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Opacity(
              opacity: opacity,
              child: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: opacity * 40),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: white,
                    ),
                    width: 8,
                    height: 8,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: opacity * 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightGray,
                    ),
                    width: 4,
                    height: 4,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: opacity * 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightGray,
                    ),
                    width: 4,
                    height: 4,
                  ),
                  Container(
                    margin: EdgeInsets.only(right: opacity * 40),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: white)),
                    width: 8,
                    height: 8,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
