import 'package:finance_manager/modules/notes_module/controller/notes_controller.dart';
import 'package:finance_manager/modules/notes_module/views/goal/goal_view.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../routes/routes.dart';

class NotesModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => NotesController()),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Routes.goal,
      child: (context, args) =>
          GoalView(controller: Modular.get<NotesController>()),
    ),
    ChildRoute(
      Routes.notes,
      child: (context, args) =>
          GoalView(controller: Modular.get<NotesController>()),
    ),
  ];
}
