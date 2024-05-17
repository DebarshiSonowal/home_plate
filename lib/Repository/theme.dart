import 'package:flutter/cupertino.dart';

class CustomTheme extends ChangeNotifier {
  bool isDarkMode = false;

  void changeTheme(){
    isDarkMode = !isDarkMode;
    notifyListeners();
  }

}
