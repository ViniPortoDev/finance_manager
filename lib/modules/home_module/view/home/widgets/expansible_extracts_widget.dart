import 'package:finance_manager/service/prefs_service.dart';
import 'package:finance_manager/utils/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:unicons/unicons.dart';

import '../../../controller/home_controller.dart';
import 'extract_item.dart';

class ExpansibleContainerExtractsWidget extends StatefulWidget {
  final PrefsService prefs;

  final HomeController controller;
  const ExpansibleContainerExtractsWidget({
    super.key,
    required this.controller,
    required this.prefs,
  });

  @override
  State<ExpansibleContainerExtractsWidget> createState() =>
      _ExpansibleContainerExtractsWidgetState();
}

class _ExpansibleContainerExtractsWidgetState
    extends State<ExpansibleContainerExtractsWidget> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.4,
      maxChildSize: 0.7,
      builder: (context, scrollController) => Container(
        height: size.height * 0.5,
        width: size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 4,
                        width: 42,
                        decoration: const BoxDecoration(
                          color: CustomColors.secoundary,
                          borderRadius: BorderRadius.all(
                            Radius.circular(16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gastos e Ganhos',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Icon(UniconsLine.search)
                ],
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: widget.controller.extractList.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                  itemBuilder: (BuildContext context, int index) {
                    final extractList = widget.controller.extractList[index];
                    return ExtractItem(
                      controller: widget.controller,
                      extractType: extractList.extractType,
                      icon: extractList.icon,
                      title: extractList.title,
                      description: extractList.description,
                      price: extractList.price,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
