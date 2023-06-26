import 'package:flutter/material.dart';
import '../../../utils/custom_colors.dart';


class CustomFloactinActionButtonWidget extends StatelessWidget {
  final void Function()? onPressed;
  const CustomFloactinActionButtonWidget({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: CustomColors.terciary,
      splashColor: CustomColors.widgetBackgrounds,
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
