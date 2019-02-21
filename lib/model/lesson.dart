class Lesson {
  final LessonType type;
  final location;
  final DateTime time;
  final data;

  Lesson({this.type, this.location, this.time, this.data});
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