import 'package:flutter/widgets.dart';

class ScreenIndexProvider with ChangeNotifier {
  int screenIndex = 0;
  int get fetchCurrentIndex {
    return screenIndex;
  }

  void updateScreenIndex(int index) {
    screenIndex = index;
    notifyListeners();
  }
}
