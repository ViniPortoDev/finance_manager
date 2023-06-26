import 'package:finance_manager/modules/home_module/widgets/custom_buttom_widget.dart';
import 'package:finance_manager/service/prefs_service.dart';
import 'package:finance_manager/utils/service_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../routes/routes.dart';
import '../../../../utils/custom_colors.dart';
import '../../controller/home_controller.dart';

class InfoView extends StatelessWidget {
  final PrefsService prefs;
  final HomeController controller;
  const InfoView({
    super.key,
    required this.controller,
    required this.prefs,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.primary,
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.width * 0.65,
            decoration: const BoxDecoration(
              color: CustomColors.terciary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(200, 30),
                bottomRight: Radius.elliptical(200, 30),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: size.width * 0.25),
                    const Text(
                      'Cadastre seu\nsaldo Inicial',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 24,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'inicie seu controle de gasto com seu saldo atual',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                        color: Color.fromARGB(255, 163, 163, 163),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  controller: controller.balanceController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefix: Text(
                      'R\$ ',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CustomColors.widgetBackgrounds,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 42),
                  child: CustomButtomWidget(
                    title: 'Começar',
                    onTap: () {
                      prefs.saveInfos(
                        ServiceKeys.balance,
                        controller.balanceController.text,
                      );
                      Modular.to.navigate(Routes.home);
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
