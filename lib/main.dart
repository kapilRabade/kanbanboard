import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:kanban_board/core/data/local/shared_preference_keys.dart';
import 'package:kanban_board/core/data/local/shared_preference_utils.dart';
import 'package:kanban_board/core/multi_language/languages.dart';
import 'package:kanban_board/core/ui/theme/theme_manager.dart';
import 'package:kanban_board/di/injection_container.dart' as di;
import 'package:kanban_board/pages/task_screen/cubit/task_cubit.dart';

import 'di/injection_container.dart';
import 'route/router.dart';








void main() {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeManager.appTheme,
    locale: Get.locale,
    translations: Languages(),
    fallbackLocale: Get.deviceLocale,
    onGenerateRoute: MRouter.generateRoute,
    initialRoute: MRouter.KanbanBoardProjectScreenViewRoute,

  ));
}
