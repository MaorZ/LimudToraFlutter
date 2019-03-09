import 'package:flutter/material.dart';
import 'package:limud_tora/widgets/core/inheritedState.dart';
import 'package:limud_tora/widgets/shared/lessonCard.dart';
import '../model/lesson.dart';

class LessonListPage extends StatefulWidget {
  final LessonsQuery lessonsQuery;

  LessonListPage({this.lessonsQuery});

  @override
  LessonListPageState createState() {
    return new LessonListPageState();
  }
}

class LessonListPageState extends State<LessonListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(68, 68, 68, 1),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Color.fromRGBO(0, 0, 0, 1),
              ),
            ),
            Expanded(
              child: StreamBuilder<List<Lesson>>(
                stream: GlobalStateWidget.of(context).lessonsBloc.lessons,
                builder: lessonsListBuilder,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget lessonsListBuilder(
      BuildContext context, AsyncSnapshot<List<Lesson>> snapshot) {
    if (snapshot.hasError) {
      return Text("Error!");
    } else if (snapshot.data == null) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
//                    Text('Loading'),
              CircularProgressIndicator(
                backgroundColor: Colors.black,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              )
            ],
          ),
        ],
      );
    } else {
      return ListView.builder(
        padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
        itemBuilder: (context, position) {
          return Padding(
            padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
            child: LessonCard(lesson: snapshot.data[position]),
          );
        },
        itemCount: snapshot.data.length,
      );
    }
  }
}

/*
* ListView.builder(
            itemBuilder: (context, position) {
              return Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: LessonCard(),
              );
            },
            itemCount: snapshot.data.length,
          )*/

/*
* return Scaffold(
      appBar: AppBar(
        title: Text('רשימת שיעורים'),
      ),
      body: StreamBuilder<List<Lesson>>(
        stream: GlobalStateWidget.of(context).lessonsBloc.lessons,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error!");
          } else if (snapshot.data == null) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
//                    Text('Loading'),
                    CircularProgressIndicator(
                      backgroundColor: Colors.black,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                    )
                  ],
                ),
              ],
            );
          } else {
            return Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemBuilder: (context, position) {
                    return Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: LessonCard(),
                    );
                  },
                  itemCount: snapshot.data.length,
                ),
              ),
            );
          }
        },
        initialData: null,
      ),
    );
* */
