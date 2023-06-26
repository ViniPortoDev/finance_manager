import 'package:finance_manager/modules/home_module/controller/home_controller.dart';
import 'package:finance_manager/modules/home_module/view/home/widgets/triple_circle_widget.dart';
import 'package:finance_manager/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class BalanceCardWidget extends StatelessWidget {
  final HomeController controller;
  const BalanceCardWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          height: size.width * 0.5,
          width: size.width * 0.85,
          decoration: BoxDecoration(
            color: CustomColors.widgetBackgrounds,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                spreadRadius: 2,
                blurRadius: 20,
                color: Color.fromARGB(255, 190, 4, 23),
              ),
            ],
          ),
          child: Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              const TripleCirculeWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 12),
                        const Text(
                          'Saldo Atual',
                          style: TextStyle(
                            // fontWeight: FontWeight.w400,
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            color: Color(0xffF8A3A4),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'R\$ ${controller.balanceController.text}',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 32,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          '**** 9041',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                        Image.asset(
                          'assets/images/visa.png',
                          height: size.width * 0.13,
                          width: size.width * 0.13,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        // const TripleCirculeWidget()
      ],
    );
  }
}
