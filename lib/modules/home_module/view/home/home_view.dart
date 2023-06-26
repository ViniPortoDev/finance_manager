import 'package:finance_manager/modules/home_module/controller/home_controller.dart';
import 'package:finance_manager/modules/home_module/view/home/widgets/balance_card_widget.dart';
import 'package:finance_manager/modules/home_module/view/home/widgets/expansible_extracts_widget.dart';
import 'package:finance_manager/modules/home_module/view/home/widgets/user_list_tile_widget.dart';
import 'package:finance_manager/utils/custom_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../service/prefs_service.dart';
import '../../widgets/custom_bottom_navigatorbar_widget.dart';
import '../../widgets/custom_floacting_action_button_widget.dart';
import 'widgets/extract_popup_widget.dart';

class HomeView extends StatefulWidget {
  final PrefsService prefs;
  final HomeController controller;
  const HomeView({
    super.key,
    required this.controller,
    required this.prefs,
  });

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    widget.controller.loadExtract();
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      backgroundColor: CustomColors.primary,
      floatingActionButton: CustomFloactinActionButtonWidget(
        onPressed: () => showDialog(
          context: context,
          builder: (context) => ExtractPopupWidget(
            prefs: widget.prefs,
            controller: widget.controller,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: const CustomBottomNavigatorBar(),
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.width * 0.7,
            decoration: const BoxDecoration(
              color: CustomColors.terciary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(200, 30),
                bottomRight: Radius.elliptical(200, 30),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const SizedBox(height: 42),
                  const UserListTileWidget(),
                  const SizedBox(height: 18),
                  BalanceCardWidget(
                    controller: widget.controller,
                  ),
                ],
              ),
            ],
          ),
          ExpansibleContainerExtractsWidget(
            prefs: widget.prefs,
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}
