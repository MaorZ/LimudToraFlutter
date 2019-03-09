import 'package:flutter/material.dart';
import 'package:limud_tora/blocs/lessons_bloc.dart';
import 'package:limud_tora/pages/lessonList.dart';
import 'package:limud_tora/widgets/core/inheritedState.dart';

import './pages/lessonFinder.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlobalStateWidget(
      lessonsBloc: LessonsBloc(),
      child: MaterialApp(
        title: 'Tora Finder',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          accentColor: Colors.white
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => LessonFinderPage(),
          '/lessonsList': (context) => LessonListPage()
        }
      ),
    );
  }
}
