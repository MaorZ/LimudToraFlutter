import 'package:limud_tora/model/lesson.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart';

import 'dart:async';

List<Lesson> mockLessons = [
  Lesson(
    data: 'Gmara Ba Rama',
    location: '123',
    time: DateTime.now(),
    type: LessonType(
      typeName: 'Gmara',
      typeValue: 1,
    ),
    description:
        'שיעור שבועי בספר התניא על פרשיות השבוע, עם כיבוד קל ותפילת ערבית',
  ),
  Lesson(
    data: 'Mishna Be Shnia',
    location: '234',
    time: DateTime.now().add(Duration(days: 1, hours: 1)),
    type: LessonType(
      typeName: 'Mishna',
      typeValue: 2,
    ),
    description:
        'ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ארוך טקס ',
  ),
  Lesson(
    data: 'Tania Be Yavne',
    location: '345',
    time: DateTime.now().add(Duration(days: 2, hours: 2, minutes: 30)),
    type: LessonType(
      typeName: 'Tania',
      typeValue: 3,
    ),
    description:
        'שיעור שבועי בספר התניא על פרשיות השבוע, עם כיבוד קל ותפילת ערבית',
  ),
  Lesson(
    data: 'Tania Be Yavne',
    location: '345',
    time: DateTime.now().add(Duration(days: 2)),
    type: LessonType(
      typeName: 'Tania',
      typeValue: 3,
    ),
    description:
        'שיעור שבועי בספר התניא על פרשיות השבוע, עם כיבוד קל ותפילת ערבית',
  ),
  Lesson(
    data: 'Tania Be Yavne',
    location: '345',
    time: DateTime.now().add(Duration(days: 2)),
    type: LessonType(
      typeName: 'Tania',
      typeValue: 3,
    ),
    description:
        'שיעור שבועי בספר התניא על פרשיות השבוע, עם כיבוד קל ותפילת ערבית',
  ),
  Lesson(
    data: 'Tania Be Yavne',
    location: '345',
    time: DateTime.now().add(Duration(days: 2)),
    type: LessonType(
      typeName: 'Tania',
      typeValue: 3,
    ),
    description:
        'שיעור שבועי בספר התניא על פרשיות השבוע, עם כיבוד קל ותפילת ערבית',
  ),
  Lesson(
    data: 'Tania Be Yavne',
    location: '345',
    time: DateTime.now().add(Duration(days: 2)),
    type: LessonType(
      typeName: 'Tania',
      typeValue: 3,
    ),
    description:
        'שיעור שבועי בספר התניא על פרשיות השבוע, עם כיבוד קל ותפילת ערבית',
  ),
  Lesson(
    data: 'Tania Be Yavne',
    location: '345',
    time: DateTime.now().add(Duration(days: 2)),
    type: LessonType(
      typeName: 'Tania',
      typeValue: 3,
    ),
    description:
        'שיעור שבועי בספר התניא על פרשיות השבוע, עם כיבוד קל ותפילת ערבית',
  ),
  Lesson(
    data: 'Tania Be Yavne',
    location: '345',
    time: DateTime.now().add(Duration(days: 2)),
    type: LessonType(
      typeName: 'Tania',
      typeValue: 3,
    ),
    description:
        'שיעור שבועי בספר התניא על פרשיות השבוע, עם כיבוד קל ותפילת ערבית',
  ),
  Lesson(
    data: 'Tania Be Yavne',
    location: '345',
    time: DateTime.now().add(Duration(days: 2)),
    type: LessonType(
      typeName: 'Tania',
      typeValue: 3,
    ),
    description:
        'שיעור שבועי בספר התניא על פרשיות השבוע, עם כיבוד קל ותפילת ערבית',
  ),
  Lesson(
    data: 'Tania Be Yavne',
    location: '345',
    time: DateTime.now().add(Duration(days: 2)),
    type: LessonType(
      typeName: 'Tania',
      typeValue: 3,
    ),
    description:
        'שיעור שבועי בספר התניא על פרשיות השבוע, עם כיבוד קל ותפילת ערבית',
  ),
  Lesson(
    data: 'Tania Be Yavne',
    location: '345',
    time: DateTime.now().add(Duration(days: 2)),
    type: LessonType(
      typeName: 'Tania',
      typeValue: 3,
    ),
    description:
        'שיעור שבועי בספר התניא על פרשיות השבוע, עם כיבוד קל ותפילת ערבית',
  ),
  Lesson(
    data: 'Tania Be Yavne',
    location: '345',
    time: DateTime.now().add(Duration(days: 2)),
    type: LessonType(
      typeName: 'Tania',
      typeValue: 3,
    ),
    description:
        'שיעור שבועי בספר התניא על פרשיות השבוע, עם כיבוד קל ותפילת ערבית',
  ),
  Lesson(
    data: 'Tania Be Yavne',
    location: '345',
    time: DateTime.now().add(Duration(days: 2)),
    type: LessonType(
      typeName: 'Tania',
      typeValue: 3,
    ),
    description:
        'שיעור שבועי בספר התניא על פרשיות השבוע, עם כיבוד קל ותפילת ערבית',
  ),
  Lesson(
    data: 'Tania Be Yavne',
    location: '345',
    time: DateTime.now().add(Duration(days: 2)),
    type: LessonType(
      typeName: 'Tania',
      typeValue: 3,
    ),
    description:
        'שיעור שבועי בספר התניא על פרשיות השבוע, עם כיבוד קל ותפילת ערבית',
  ),
];

class LessonsBloc {
  final _lessonsSubject = BehaviorSubject<List<Lesson>>(seedValue: null);
  final _searchLessons = StreamController<LessonsQuery>();

  Stream<List<Lesson>> get lessons => _lessonsSubject.stream;

  StreamSink<LessonsQuery> get searchLessons => _searchLessons.sink;

  LessonsBloc() {
    var searchLessons$ =
        Observable<LessonsQuery>(_searchLessons.stream).distinct();
    searchLessons$.listen((lq) {
      _handleSearchLessons(lq);
    });
  }

  _handleSearchLessons(LessonsQuery lq) {
    _lessonsSubject.add(null);

    _fetchLessons(lq).then((resultLessons) {
      _lessonsSubject.add(resultLessons);
    });
  }

  Future<List<Lesson>> _fetchLessons(LessonsQuery lq) async {
//    final response =
//        await get('https://jsonplaceholder.typicode.com/posts/1');
    final response =
        await Future.delayed(Duration(milliseconds: 500), () => mockLessons);

    return response;

//    if (response.statusCode == 200) {
//      // If server returns an OK response, parse the JSON
//      return Post.fromJson(json.decode(response.body));
//    } else {
//      // If that response was not OK, throw an error.
//      throw Exception('Failed to load post');
//    }
  }
}
