import 'package:finance_manager/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

class CustomBottomNavigatorBar extends StatelessWidget {
  
  const CustomBottomNavigatorBar({super.key, });

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
              onPressed: () {},
              icon: const Icon(
                UniconsLine.home_alt,
                color: CustomColors.widgetBackgrounds,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                UniconsLine.wallet,
                color: Colors.white,
                size: 28,
              ),
            ),
            const SizedBox(width: 12),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                UniconsLine.chart,
                color: Colors.white,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                UniconsLine.user,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
