import 'package:finance_manager/modules/home_module/controller/home_controller.dart';
import 'package:flutter/material.dart';

class ExtractItem extends StatelessWidget {
  final HomeController controller;
  final int extractType;
  final String icon;
  final String title;
  final String description;
  final String price;

  const ExtractItem({
    super.key,
    required this.controller,
    required this.extractType,
    required this.icon,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Text(
        icon == '' ? '🧾' : icon,
        style: const TextStyle(fontSize: 28),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        description == ''
            ? controller.dateConvert(DateTime.now())
            : description,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 12,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          extractType == 0
              ? const Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.green,
                )
              : const Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.red,
                ),
          Text(
            extractType == 0 ? '  +R\$$price' : '  -R\$$price',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: extractType == 0 ? Colors.green : Colors.red,
            ),
          )
        ],
      ),
    );
  }
}
