import 'package:finance_manager/global/controller/global_controller.dart';
import 'package:finance_manager/routes/routes.dart';
import 'package:finance_manager/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:unicons/unicons.dart';

class CustomBottomNavigatorBar extends StatelessWidget {
  final GlobalController globalController;
  final int iconSelected;
  const CustomBottomNavigatorBar({
    super.key,
    required this.iconSelected,
    required this.globalController,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: CustomColors.terciary,
      shape: const CircularNotchedRectangle(),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 14,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () => Modular.to.navigate(Routes.home),
              icon: Icon(
                UniconsLine.home_alt,
                color: iconSelected == 0
                    ? CustomColors.widgetBackgrounds
                    : Colors.white,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () => globalController.goal.numberValue == 0.0
                  ? Modular.to.navigate(Routes.goal)
                  : Modular.to.navigate(Routes.notes),
              icon: Icon(
                UniconsLine.wallet,
                color: iconSelected == 1
                    ? CustomColors.widgetBackgrounds
                    : Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              onPressed: () {},
              icon: Icon(
                UniconsLine.chart,
                color: iconSelected == 2
                    ? CustomColors.widgetBackgrounds
                    : Colors.white,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(
                UniconsLine.user,
                color: iconSelected == 3
                    ? CustomColors.widgetBackgrounds
                    : Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
