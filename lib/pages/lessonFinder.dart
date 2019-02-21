import 'package:flutter/material.dart';
import 'package:limud_tora/model/lesson.dart';
import 'package:limud_tora/widgets/inheritedState.dart';

class LessonFinderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(68, 68, 68, 1),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 40.0),
          child: Column(
            children: <Widget>[
              Expanded(
                child: GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(242, 242, 242, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    constraints: BoxConstraints.expand(),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.search,
                            size: 80.0,
                            color: Colors.black,
                          ),
                          Text(
                            'צא ולמד',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 40.0,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            'מצא את השיעור הקרוב אליך',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    GlobalStateWidget.of(context).lessonsBloc.searchLessons.add(LessonsQuery());
                    Navigator.pushNamed(context, '/lessonsList');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              SizedBox(
                height: 100.0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(175, 175, 175, 1),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'חיפוש מתקדם',
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 30.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              SizedBox(
                height: 100.0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(175, 175, 175, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: buildSearchByButton('מיקום השיעור'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(175, 175, 175, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: buildSearchByButton('נושא השיעור'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20.0),
              ),
              SizedBox(
                height: 100.0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(175, 175, 175, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: buildSearchByButton('טווח שעות'),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                    ),
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(175, 175, 175, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        child: buildSearchByButton('יום בשבוע'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildSearchByButton(String searchByText) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'חפש לפי',
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
        Text(
          searchByText,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 18.0,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}

/*
* Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: new BoxDecoration(
                gradient: new LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor,
                    ],
                    begin: const FractionalOffset(0.5, 0.0),
                    end: const FractionalOffset(0.0, 0.5),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonTheme(
                    minWidth: 300.0,
                    child: RaisedButton(
                      padding: const EdgeInsets.all(8.0),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () {
                        GlobalStateWidget.of(context).lessonsBloc.searchLessons.add(LessonsQuery());
                        Navigator.pushNamed(context, '/lessonsList');
                      },
                      elevation: 5.0,
                      child: new Text(
                        "צא ולמד!",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
* */
