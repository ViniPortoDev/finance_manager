import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:unicons/unicons.dart';
import 'package:finance_manager/modules/home_module/controller/home_controller.dart';
import '../../../../../service/prefs_service.dart';
import '../../../../../utils/custom_colors.dart';
import 'emoji_picker_widget.dart';

class ExtractPopupWidget extends StatelessWidget {
  final PrefsService prefs;
  final HomeController controller;

  const ExtractPopupWidget({
    super.key,
    required this.controller,
    required this.prefs,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Dialog(
      insetPadding: EdgeInsets.zero,
      child: Container(
        height: size.width * 0.85,
        width: size.width,
        color: CustomColors.primary,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ToggleSwitch(
              minWidth: size.width * 0.5,
              minHeight: 35,
              cornerRadius: 8,
              fontSize: 14,
              iconSize: 22,
              activeBgColors: const [
                [Colors.green],
                [Colors.red]
              ],
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.black26,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: const ['Entrada', 'Saída'],
              icons: const [
                UniconsLine.money_insert,
                UniconsLine.money_withdraw
              ],
              onToggle: (index) {
                controller.extractType = index!;
              },
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () async {
                      controller.newDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2023),
                        lastDate: DateTime(2036),
                      );
                    },
                    child: Container(
                      height: 30,
                      width: 120,
                      decoration: BoxDecoration(
                        color: CustomColors.terciary,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Center(
                        child: Text(
                          'Selecione a data',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(left: 6, right: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return EmojiPickerWidget(
                            emojiController: controller.emojiController,
                          );
                        },
                      );
                    },
                    icon: const Icon(
                      Icons.add_reaction_outlined,
                      color: Color.fromARGB(255, 65, 96, 146),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: size.width * 0.5,
                    child: TextFormField(
                      controller: controller.descriptionController,
                      decoration: const InputDecoration(
                        label: Text('Descrição'),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 92, 181, 255),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: size.width * 0.25,
                    child: TextFormField(
                      controller: controller.extractMoneyPopupController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        label: Text('R\$'),
                        prefix: Text(
                          'R\$ ',
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 92, 181, 255),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 42),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: InkWell(
                onTap: controller.addExtract,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: CustomColors.terciary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Center(
                    child: Text(
                      'Adicionar',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
