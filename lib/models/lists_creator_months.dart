import 'dart:math';

import '../settings/data.dart';

List<String> validMonths = [];
List<String> showMonths6 = [];
List<String> tempMonths = [];

String finalMonth;

class CreateMonthsLists {
  final _random = Random();

  void createShowMonths6() {
    showMonths6 = [];
    while (showMonths6.length != 6) {
      int index = _random.nextInt(kListOfMonths.length);
      String month = kListOfMonths[index];
      if (!showMonths6.contains(month)) {
        showMonths6.add(month);
      }
    }
    showMonths6.sort((a, b) => a.compareTo(b));
    // print('Show Months1: $showMonths6\n');
    // print('==========================\n');
  }

  void createValidMonths(bool visible) {
    if (visible) {
      validMonths = [];
      validMonths.addAll(showMonths6);
    } else {
      validMonths.addAll(kListOfMonths);
      for (int index = showMonths6.length; index > 0; index--) {
        validMonths.remove(showMonths6[index - 1]);
      }
    }

    // print('Valid Months1: $validMonths');
    // print('==========================\n');
    getShowMonths();
  }

  void updateValidMonths(bool visible) {
    if (validMonths.length > 1) {
      if (visible) {
        validMonths = tempMonths;
      } else {
        for (int index = tempMonths.length; index > 0; index--) {
          validMonths.remove(tempMonths[index - 1]);
        }
      }

      // print('Valid Months2 : $validMonths');
      // print('==========================\n');

      validMonths.length == 1 ? finalMonth = validMonths[0] : getShowMonths();

      if (finalMonth != null) {
        // print('Final Month: ${finalMonth.substring(1)}\n');
        // print('==========================\n');
      }
    }
  }

  void getShowMonths() {
    showMonths6 = [];
    tempMonths = [];
    while (showMonths6.length != (validMonths.length / 2).round()) {
      int index = _random.nextInt(validMonths.length);
      String value = validMonths[index];
      if (!showMonths6.contains(value)) {
        showMonths6.add(value);
        tempMonths.add(value);
      }
    }
    tempMonths.sort((a, b) => a.compareTo(b));
    // print('Temp Months: $tempMonths\n');
    // print('==========================\n');

    while (showMonths6.length != 6) {
      int index = _random.nextInt(kListOfMonths.length);
      String value = kListOfMonths[index];
      if (!showMonths6.contains(value) && !validMonths.contains(value)) {
        showMonths6.add(value);
      }
    }
    showMonths6.sort((a, b) => a.compareTo(b));
    // print('Show Months2: $showMonths6\n');
    // print('==========================\n');
  }
}
