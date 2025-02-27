// import 'package:provider/provider.dart';
// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
// import 'package:money_manager_final/default_values.dart';
import 'package:money_manager_final/functions.dart';

class Providerr extends ChangeNotifier {
  int _count = 0;
  int get count => _count;
  void inc() {
    _count++;
    notifyListeners();
  }

  void add(String time_user, String date_user, String amount_user,
      String type_user, String method_user, String description_user) async {
    userAdd(time_user, date_user, amount_user, type_user, method_user,
        description_user);
    prefsSet();
    notifyListeners();
  }

  void delete(int index) async {
    userDelete(index);
    notifyListeners();
    prefsSet();
  }
}
