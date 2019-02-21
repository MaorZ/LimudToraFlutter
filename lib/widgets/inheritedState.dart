import 'package:flutter/widgets.dart';
import 'package:limud_tora/blocs/lessons_bloc.dart';

class GlobalStateWidget extends InheritedWidget {
  final LessonsBloc lessonsBloc;

  GlobalStateWidget({this.lessonsBloc, Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static GlobalStateWidget of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(GlobalStateWidget);
}
