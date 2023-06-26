import 'dart:convert';
import 'package:finance_manager/utils/service_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../modules/home_module/models/extract_model.dart';

class PrefsService {
  Future<void> saveInfos(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> loadBalance(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final value = prefs.getString(key);
    return value ?? '';
  }

  Future<List<ExtracModel>> loadExtracts() async {
    List<ExtracModel> newList = [];
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final listJson = prefs.getString(ServiceKeys.extractList);
    if (listJson == null || listJson == '') {
      return [];
    }
    final listMap = jsonDecode(listJson);
    for (var i in listMap) {
      final extract = jsonDecode(i);
      newList.add(ExtracModel.fromMap(extract));
    }
    return newList;
  }
}
