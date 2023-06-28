import 'package:finance_manager/global/controller/global_controller.dart';
import 'package:finance_manager/modules/home_module/home_module.dart';
import 'package:finance_manager/modules/notes_module/notes_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../routes/routes.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    //TODO incerteza para colocar o global controller aqui ou na homemodule
    Bind.lazySingleton((i) => GlobalController()),
  ];
  @override
  final List<ModularRoute> routes = [
    //TODO talvez precise colocar o notes aqui
    ModuleRoute(
      Routes.splash,
      module: HomeModule(),
    ),
    ModuleRoute(
      Routes.goal,
      module: NotesModule(),
    ),
  ];
}
