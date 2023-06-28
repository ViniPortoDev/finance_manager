import 'package:finance_manager/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class CustomButtomWidget extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  const CustomButtomWidget({
    super.key,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: CustomColors.widgetBackgrounds,
          boxShadow: const [
            BoxShadow(
              spreadRadius: 0.1,
              blurRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
