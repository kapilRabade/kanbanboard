import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board/main.dart';
import 'package:kanban_board/pages/project_screen/view/kanban_projects_view.dart';
import 'package:kanban_board/pages/task_screen/view/projects_task_view.dart';
import 'package:rxdart/rxdart.dart';


class MRouter {
  final _currentRouteSubject = BehaviorSubject<String>();

  StreamSink<String> get _currentRouteSink => _currentRouteSubject.sink;

  Stream<String> get currentRouteStream => _currentRouteSubject.stream;

  String get currentRoute => _currentRouteSubject.value;

  void closeStream() => _currentRouteSubject.close();

  static const String KanbanBoardProjectScreenViewRoute = 'KanbanBoardProjectScreenView';
  static const String TaskViewWidgetRoute = 'TaskViewWidget';



  void updateRoute(String routeName) => _currentRouteSink.add(routeName);

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case KanbanBoardProjectScreenViewRoute:
        return CupertinoPageRoute(builder: (_) => KanbanBoardProjectScreenView());
      case TaskViewWidgetRoute:
        String projectId = (settings.arguments as List<dynamic>)[0] as String;
        String projectName = (settings.arguments as List<dynamic>)[1] as String;
        return CupertinoPageRoute(builder: (_) => TaskViewWidget(
            projectId: projectId, projectName: projectName
        ));



      default:
        return CupertinoPageRoute(builder: (_) => NoRouteScreen(settings.name));
    }
  }

  static Future<Object?>? pushNamedAndRemoveUntil(
      BuildContext context, String named) {
    return Get.offNamedUntil(named, (Route<dynamic> route) => false);
  }

  static pop(BuildContext context) {
    return Navigator.pop(context);
  }
}

class NoRouteScreen extends StatelessWidget {
  final String? screenName;

  const NoRouteScreen(this.screenName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('${'no_route_defined'} "$screenName"')),
    );
  }
}
