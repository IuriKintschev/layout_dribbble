import 'package:desing_map/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import 'main_page.dart';

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
