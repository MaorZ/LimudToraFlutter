import 'package:flutter/animation.dart';

class LessonCardAnimation {
  LessonCardAnimation({this.controller, this.descriptionHeight})
      : bottomRightRadius = Tween(begin: 10.0, end: 0.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.0,
              0.2,
              curve: Curves.ease,
            ),
          ),
        ),
        arrowRotation = Tween<double>(begin: 0, end: 180).animate(
          CurvedAnimation(
            parent: controller,
            curve: new Interval(
              0.0,
              0.5,
              curve: Curves.easeInOut,
            ),
          ),
        ),
        detailsHeight =
            Tween<double>(begin: 0, end: (80.0 + descriptionHeight)).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeIn,
          ),
        ),
        descriptionFade = Tween<double>(
          begin: 0.0,
          end: 1,
        ).animate(CurvedAnimation(
          parent: controller,
          curve: new Interval(
            10 / (80.0 + descriptionHeight),
            (descriptionHeight + 10) / (80.0 + descriptionHeight),
            curve: Curves.easeIn,
          ),
        )),
        descriptionSlide =
            Tween<double>(begin: (-descriptionHeight / 2), end: 0)
                .animate(CurvedAnimation(
          parent: controller,
          curve: new Interval(
            10 / (80.0 + descriptionHeight),
            (descriptionHeight + 10) / (80.0 + descriptionHeight),
            curve: Curves.easeIn,
          ),
        ));

  final double descriptionHeight;
  final AnimationController controller;
  final Animation<double> bottomRightRadius;
  final Animation<double> arrowRotation;
  final Animation<double> detailsHeight;
  final Animation<double> descriptionFade;
  final Animation<double> descriptionSlide;
}
