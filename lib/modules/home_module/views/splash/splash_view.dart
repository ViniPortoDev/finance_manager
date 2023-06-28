import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:finance_manager/modules/home_module/controller/home_controller.dart';
import 'package:finance_manager/routes/routes.dart';
import 'package:finance_manager/utils/custom_colors.dart';

class SplashView extends StatefulWidget {
  final HomeController controller;
  const SplashView({super.key, required this.controller});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    widget.controller.loadBalance();
    Timer(
      const Duration(seconds: 3),
      () => widget.controller.balanceController.numberValue == 0.0
          ? Modular.to.navigate(Routes.info)
          : Modular.to.navigate(Routes.home),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.widgetBackgrounds,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Image.asset(
            'assets/images/splash.png',
            height: 120,
            width: 120,
          ),
          const LinearProgressIndicator(
            minHeight: 10,
            backgroundColor: CustomColors.widgetBackgrounds,
            color: Color.fromARGB(255, 117, 0, 0),
          )
        ],
      ),
    );
  }
}
