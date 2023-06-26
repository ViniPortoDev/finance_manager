import 'package:finance_manager/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class CustomBottomNavigatorBar extends StatelessWidget {
  const CustomBottomNavigatorBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      color: CustomColors.terciary,
      shape: CircularNotchedRectangle(),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 14,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              UniconsLine.home_alt,
              color: CustomColors.widgetBackgrounds,
              size: 24,
            ),
            Icon(
              UniconsLine.wallet,
              color: Colors.white,
              size: 24,
            ),
            SizedBox(width: 14),
            Icon(
              UniconsLine.chart,
              color: Colors.white,
              size: 24,
            ),
            Icon(
              UniconsLine.user,
              color: Colors.white,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
