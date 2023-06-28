import 'dart:convert';

import 'package:finance_manager/modules/home_module/models/extract_model.dart';
import 'package:finance_manager/service/prefs_service.dart';
import 'package:finance_manager/utils/service_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeController extends ChangeNotifier {
  final balanceController = MoneyMaskedTextController();
  final extractMoneyPopupController = MoneyMaskedTextController();
  final descriptionController = TextEditingController();
  final emojiController = TextEditingController();
  DateTime? newDate;
  int extractType = 0;
  final prefs = PrefsService();
  final List<ExtracModel> extractList = [];

  bool isSelected() {
    bool sla = false;
    sla = !sla;
    return sla;
  }

  void addExtract() {
    extractList.insert(
      0,
      ExtracModel(
        extractType: extractType,
        icon: emojiController.text,
        title: descriptionController.text,
        description: dateConvert(newDate),
        price: extractMoneyPopupController.text,
      ),
    );
    final jsonList = jsonEncode(extractList);
    prefs.saveInfos(ServiceKeys.extractList, jsonList);
    emojiController.clear();
    Modular.to.pop();
    countExtract();
    notifyListeners();
  }

  Future<void> loadExtract() async {
    final list = await prefs.loadExtracts();
    extractList.addAll(list);
    notifyListeners();
  }

  Future<void> loadBalance() async {
    final loadedBalance = await prefs.loadBalance(ServiceKeys.balance);
    if (loadedBalance != '') {
      balanceController.text = loadedBalance;
    }
  }

  void countExtract() {
    if (extractType == 0) {
      final newBalance = balanceController.numberValue +
          extractMoneyPopupController.numberValue;
      if (newBalance.isNegative) {
        balanceController.updateValue(0);
        prefs.saveInfos(
          ServiceKeys.balance,
          balanceController.text,
        );
      } else {
        balanceController.updateValue(newBalance);
        prefs.saveInfos(
          ServiceKeys.balance,
          balanceController.text,
        );
      }
    }
    if (extractType == 1) {
      final newBalance = balanceController.numberValue -
          extractMoneyPopupController.numberValue;
      if (newBalance.isNegative) {
        balanceController.updateValue(0);
        prefs.saveInfos(
          ServiceKeys.balance,
          balanceController.text,
        );
      } else {
        balanceController.updateValue(newBalance);
        prefs.saveInfos(
          ServiceKeys.balance,
          balanceController.text,
        );
      }
    }
  }

  String dateConvert(DateTime? date) {
    if (date != null) {
      return "${date.day}/${date.month}/${date.year}";
    }
    return '';
  }
}
