import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:limud_tora/model/lesson.dart';
import 'package:intl/intl.dart' as intl;
import 'package:vector_math/vector_math_64.dart' as vectorMath;

class LessonCard extends StatefulWidget {
  final Lesson lesson;

  LessonCard({this.lesson}) {}

  @override
  _LessonCardState createState() => _LessonCardState();
}

class LessonCardAnimation {
  LessonCardAnimation(this.controller)
      : cardHeight = Tween<double>(begin: 110.0, end: 250.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeIn,
          ),
        ),
        bottomRightRadius = Tween(begin: 10.0, end: 0.0).animate(
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
        detailsHeight = Tween<double>(begin: 0, end: 140.0).animate(
          CurvedAnimation(
            parent: controller,
            curve: Curves.easeIn,
          ),
        );

  final AnimationController controller;
  final Animation<double> cardHeight;
  final Animation<double> bottomRightRadius;
  final Animation<double> arrowRotation;
  final Animation<double> detailsHeight;
}

class _LessonCardState extends State<LessonCard>
    with SingleTickerProviderStateMixin {
  bool _collapsed = false;
  LessonCardAnimation animation;
  AnimationController controller;
  intl.DateFormat _timeFormatter;

  @override
  void initState() {
    super.initState();
    _timeFormatter = intl.DateFormat('HH:mm');
    controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    animation = LessonCardAnimation(controller);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation.controller,
      builder: buildAnimatedLessonCard,
    );
  }

  Widget buildAnimatedLessonCard(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(242, 242, 242, 1),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      height: animation.cardHeight.value,
      child: Column(
        children: <Widget>[
          Container(
            height: 110.0,
            child: buildCardMainPart(),
          ),
          buildCardDetailsPart(),
        ],
      ),
    );
  }

  Row buildCardMainPart() {
    return Row(
      textDirection: TextDirection.rtl,
      children: <Widget>[
        buildExpansionArrow(),
        buildMainDetails(),
        buildActionButtons()
      ],
    );
  }

  GestureDetector buildExpansionArrow() {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (!_collapsed) {
            controller.forward();
          } else {
            controller.reverse();
          }
          _collapsed = !_collapsed;
        });
      },
      child: Container(
        constraints: BoxConstraints.expand(width: 25.0),
        decoration: BoxDecoration(
          color: Color.fromRGBO(145, 145, 145, 1),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(animation.bottomRightRadius.value),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Transform.rotate(
              angle: vectorMath.radians(animation.arrowRotation.value),
              child: Icon(
                Icons.keyboard_arrow_down,
                size: 25.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded buildMainDetails() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _timeFormatter.format(widget.lesson.time),
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 40.0,
                height: 0.8,
              ),
            ),
            Text(
              'שיעור תניא',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
                height: 0.7,
              ),
            ),
            Text(
              'רחוב עדעד 13, יבנה',
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 14.0,
                height: 0.9,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container buildActionButtons() {
    return Container(
      width: 150.0,
      padding: EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(13, 175, 188, 1),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            constraints: BoxConstraints.expand(height: 50.0),
            child: FlatButton(
              onPressed: () {},
              textColor: Colors.white,
              child: Text(
                'קח אותי לשם >',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
                textDirection: TextDirection.rtl,
              ),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(145, 145, 145, 1),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            constraints: BoxConstraints.expand(height: 30.0),
            child: FlatButton(
              onPressed: () {},
              textColor: Colors.white,
              child: Text(
                'שמור תזכורת >',
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
                textDirection: TextDirection.rtl,
              ),
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0)),
            ),
          ),
        ],
      ),
    );
  }

  Container buildCardDetailsPart() {
    return Container(
      height: animation.detailsHeight.value,
      decoration: BoxDecoration(
        color: Color.fromRGBO(114, 114, 114, 1),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(10.0),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
