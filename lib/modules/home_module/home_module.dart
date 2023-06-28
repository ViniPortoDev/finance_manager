import 'package:finance_manager/global/controller/global_controller.dart';
import 'package:finance_manager/modules/home_module/controller/home_controller.dart';
import 'package:finance_manager/modules/home_module/views/home/home_view.dart';
import 'package:finance_manager/modules/home_module/views/info/info_view.dart';
import 'package:finance_manager/modules/home_module/views/splash/splash_view.dart';
import 'package:finance_manager/service/prefs_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../routes/routes.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => PrefsService()),
    Bind.lazySingleton((i) => HomeController()),
  ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Routes.splash,
      child: (context, args) =>
          SplashView(controller: Modular.get<HomeController>()),
    ),
    ChildRoute(
      Routes.info,
      child: (context, args) => InfoView(
        prefs: Modular.get<PrefsService>(),
        controller: Modular.get<HomeController>(),
      ),
    ),
    ChildRoute(
      Routes.home,
      child: (context, args) => HomeView(
        prefs: Modular.get<PrefsService>(),
        controller: Modular.get<HomeController>(),
        globalController:Modular.get<GlobalController>(),
      ),
    ),
  ];
}
