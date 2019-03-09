class Lesson {
  final LessonType type;
  final location;
  final DateTime time;
  final data;
  final String description;
  final String lecturer;
  final Duration duration;
  final String synagogue;

  Lesson({this.type, this.location, this.time, this.data, this.description, this.lecturer, this.duration, this.synagogue});
}

class LessonType {
  int typeValue;
  String typeName;

  LessonType({this.typeName, this.typeValue});
}

class LessonsQuery {
  int lessonTypeValue;
  var location;
  DateTime from;
}