import 'package:intl/intl.dart';
import 'package:money_manager_final/default_values.dart';
import 'package:shared_preferences/shared_preferences.dart';

void userAdd(String time_user, String date_user, String amount_user,
    String type_user, String method_user, String description_user) {
  time.add(time_user);
  date.add(date_user);
  amount.add(amount_user);
  type.add(type_user);
  method.add(method_user);
  desc.add(description_user);
}

// void prefsAdd() {}
Future<void> prefsGet() async {
  final pref = await SharedPreferences.getInstance();
  amount = pref.getStringList('amount')!;
  desc = pref.getStringList('desc')!;
  time = pref.getStringList('time')!;
  date = pref.getStringList('date')!;
  type = pref.getStringList('type')!;
  method = pref.getStringList('method')!;
}

Future<void> prefsSet() async {
  final pref = await SharedPreferences.getInstance();
  pref.setStringList('amount', amount);
  pref.setStringList('time', time);
  pref.setStringList('date', date);
  pref.setStringList('method', method);
  pref.setStringList('type', type);
  pref.setStringList('desc', desc);
}

void userDelete(int index) {
  time.removeAt(index);
  date.removeAt(index);
  amount.removeAt(index);
  type.removeAt(index);
  method.removeAt(index);
  desc.removeAt(index);
}

double calculate_daily() {
  String currDate = '${DateTime.now().day}/${DateTime.now().month}';

  // String currDate1 = currDate.substring(0, 5);
  // print(currDate1);
  double total = 0;
  for (int i = 0; i < date.length; i++) {
    if (currDate == date[i]) {
      if (type[i] == 'Credit') {
        total += double.parse(amount[i]);
      } else {
        total -= double.parse(amount[i]);
      }
    }
  }
  return total;
}

double calculate_monthly() {
  String currMonth = '${DateTime.now().month}';
  // print('Current month: ${date[0].substring(3)}');
  // print(currMonth);
  // String currDate1 = currDate.substring(0, 5);
  // print(currDate1);
  double total = 0;
  for (int i = 0; i < date.length; i++) {
    if (currMonth == date[i].substring(3)) {
      if (type[i] == 'Credit') {
        total += double.parse(amount[i]);
      } else {
        total -= double.parse(amount[i]);
      }
    }
  }
  return total;
}
