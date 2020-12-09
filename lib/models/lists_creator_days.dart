import 'dart:math';

List<int> validDays = [];
List<int> showDays16 = [];
List<int> tempDays = [];

int finalDay = 0;

class CreateDaysLists {
  final _random = Random();

  void createShowDays16() {
    showDays16 = [];
    while (showDays16.length != 16) {
      int value = 1 + _random.nextInt(32 - 1);
      if (!showDays16.contains(value)) {
        showDays16.add(value);
      }
    }
    showDays16.sort((a, b) => a.compareTo(b));
    // print('Show Days1: $showDays16\n');
    // print('==========================\n');
  }

  void createValidDays(bool visible) {
    if (visible) {
      validDays = [];
      validDays.addAll(showDays16);
    } else {
      validDays = List<int>.generate(31, (i) => i + 1);
      for (int index = showDays16.length; index > 0; index--) {
        validDays.remove(showDays16[index - 1]);
      }
    }
    // showDays16.sort((a, b) => a.compareTo(b));
    // print('Valid Days1: $validDays');
    // print('==========================\n');
    getShowDays();
  }

  void updateValidDays(bool visible) {
    if (validDays.length > 1) {
      if (visible) {
        validDays = tempDays;
      } else {
        // validNumbs = List<int>.generate(31, (i) => i + 1);
        for (int index = tempDays.length; index > 0; index--) {
          validDays.remove(tempDays[index - 1]);
        }
      }
      // showDays16.sort((a, b) => a.compareTo(b));
      // print('Valid Days2 : $validDays');
      // print('==========================\n');

      validDays.length == 1 ? finalDay = validDays[0] : getShowDays();
    }
  }

  void getShowDays() {
    showDays16 = [];
    tempDays = [];
    while (showDays16.length != (validDays.length / 2).round()) {
      int index = _random.nextInt(validDays.length);
      int value = validDays[index];
      if (!showDays16.contains(value)) {
        showDays16.add(value);
        tempDays.add(value);
      }
    }
    tempDays.sort((a, b) => a.compareTo(b));
    // print('Temp Days: $tempDays\n');
    // print('==========================\n');

    while (showDays16.length != 16) {
      int value = 1 + _random.nextInt(32 - 1);
      if (!showDays16.contains(value) && !validDays.contains(value)) {
        showDays16.add(value);
      }
    }
    showDays16.sort((a, b) => a.compareTo(b));
    // print('Show Days2: $showDays16\n');
    // print('==========================\n');
  }
}
