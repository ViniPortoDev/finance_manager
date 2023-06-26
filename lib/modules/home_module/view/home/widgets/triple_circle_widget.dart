// import 'package:finance_manager/utils/custom_colors.dart';
import 'package:flutter/material.dart';

class TripleCirculeWidget extends StatelessWidget {
  const TripleCirculeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      alignment: AlignmentDirectional.centerEnd,
      children: [
        Positioned(
          right: -10,
          top: size.width * 0.235,
          child: Container(
            height: size.width * 0.3,
            width: size.width * 0.3,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  spreadRadius: 5,
                  blurRadius: 10,
                  color: Color.fromARGB(255, 218, 20, 40),
                ),
              ],
              color: Color(0xffF21D33),
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(232, 243, 69, 69),
                  Color.fromARGB(55, 242, 29, 50),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: -10,
          top: size.width * 0.06,
          child: Container(
            height: size.width * 0.3,
            width: size.width * 0.3,
            decoration: const BoxDecoration(
              color: Color(0xffF21D33),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 5,
                  blurRadius: 10,
                  color: Color.fromARGB(255, 218, 20, 40),
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 236, 65, 65),
                  Color.fromARGB(57, 242, 29, 50),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          right: -10,
          top: -40,
          child: Container(
            width: size.width * 0.3,
            height: size.width * 0.3,
            decoration: const BoxDecoration(
              color: Color(0xffF21D33),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  spreadRadius: 5,
                  blurRadius: 10,
                  color: Color.fromARGB(255, 218, 20, 40),
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color.fromARGB(255, 236, 65, 65),
                  Color.fromARGB(75, 242, 29, 50),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
