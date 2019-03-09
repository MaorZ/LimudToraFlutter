import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:limud_tora/model/lesson.dart';
import 'package:intl/intl.dart' as intl;
import 'package:limud_tora/widgets/shared/lessonCardAnimation.dart';
import 'package:limud_tora/widgets/utils/sizeFetcher.dart';
import 'package:vector_math/vector_math_64.dart' as vectorMath;

class LessonCard extends StatefulWidget {
  final Lesson lesson;

  LessonCard({this.lesson});

  @override
  _LessonCardState createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard>
    with SingleTickerProviderStateMixin {
  bool _collapsed = false;
  double descriptionHeight;
  LessonCardAnimation animation;
  AnimationController controller;
  intl.DateFormat _timeFormatter;

  @override
  void initState() {
    super.initState();
    _timeFormatter = intl.DateFormat('HH:mm');
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    animation = LessonCardAnimation(
      controller: controller,
      descriptionHeight: 60.0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: buildAnimatedLessonCard,
    );
  }

  Widget buildAnimatedLessonCard(BuildContext context, Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(242, 242, 242, 1),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      height: 110 + animation.detailsHeight.value,
      child: Column(
        children: <Widget>[
          fetchDescriptionSizeBuilder(),
          buildCardMainPart(),
          buildCardDetailsPart(),
        ],
      ),
    );
  }

  Widget fetchDescriptionSizeBuilder() {
    return descriptionHeight == null
        ? SizeFetcher(
            child: buildLessonDescription(false),
            sizeFetched: (Size size) {
              setState(() {
                descriptionHeight = size.height;
                animation = LessonCardAnimation(
                  controller: controller,
                  descriptionHeight: descriptionHeight,
                );
              });
            },
          )
        : Container();
  }

  Container buildLessonDescription(bool withHeight) {
    if (withHeight) {
      return Container(
        height: (animation.detailsHeight.value > descriptionHeight
            ? descriptionHeight
            : animation.detailsHeight.value),
        padding: EdgeInsets.fromLTRB(40, 10, 15, 10),
        child: Transform(
          transform:
              Matrix4.translationValues(0, animation.descriptionSlide.value, 0),
          child: Opacity(
            opacity: animation.descriptionFade.value,
            child: Text(
              widget.lesson.description,
              style: TextStyle(
                color: Color.fromRGBO(223, 223, 223, 1),
                fontSize: 14.0,
                fontWeight: FontWeight.w900,
              ),
              textDirection: TextDirection.rtl,
            ),
          ),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.fromLTRB(40, 10, 15, 10),
        child: Text(
          widget.lesson.description,
          style: TextStyle(
            color: Color.fromRGBO(223, 223, 223, 1),
            fontSize: 14.0,
            fontWeight: FontWeight.w900,
          ),
          textDirection: TextDirection.rtl,
        ),
      );
    }
  }

  Container buildCardMainPart() {
    return Container(
      height: 110.0,
      child: Row(
        textDirection: TextDirection.rtl,
        children: <Widget>[
          buildExpansionArrow(),
          buildMainDetails(),
          buildActionButtons()
        ],
      ),
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
              widget.lesson.type.typeName,
              textDirection: TextDirection.rtl,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w900,
                height: 0.7,
              ),
            ),
            Text(
              widget.lesson.location,
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

  ClipRect buildCardDetailsPart() {
    return ClipRect(
      child: Container(
        height: animation.detailsHeight.value,
        decoration: BoxDecoration(
          color: Color.fromRGBO(114, 114, 114, 1),
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
          ),
        ),
        child: Column(
          children: <Widget>[
            descriptionHeight != null
                ? buildLessonDescription(true)
                : Container(),
            Expanded(
              child: Row(
                textDirection: TextDirection.rtl,
                children: <Widget>[
                  Expanded(
                    child: ClipRect(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
                        child: Column(
                          textDirection: TextDirection.rtl,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Row(
                                textDirection: TextDirection.rtl,
                                children: <Widget>[
                                  Text(
                                    'משך השיעור: ',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Text(
                                    'שעה',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                textDirection: TextDirection.rtl,
                                children: <Widget>[
                                  Text(
                                    'מגיד השיעור: ',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Text(
                                    widget.lesson.lecturer,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              child: Row(
                                textDirection: TextDirection.rtl,
                                children: <Widget>[
                                  Text(
                                    'בית כנסת: ',
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900,
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  Text(
                                    widget.lesson.synagogue,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 80.0,
                    height: 80.0,
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      onPressed: () {},
                      color: Color.fromRGBO(164, 164, 164, 1),
                      textColor: Colors.white,
                      child: Icon(Icons.edit),
                      shape: CircleBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
