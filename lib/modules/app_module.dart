import 'package:finance_manager/modules/home_module/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../routes/routes.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];
  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      Routes.splash,
      module: HomeModule(),
    ),
  ];
}
