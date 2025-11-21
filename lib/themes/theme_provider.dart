import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'dark_mode.dart';
import 'light_mode.dart';

class ThemeProvider extends ChangeNotifier{
  // initially , light Mode
  ThemeData _themeData=lightMode;

  // get Theme
ThemeData get themeData => _themeData;

// iss dark mode
  bool get isDarkMode => _themeData==darkMode;


// set Theme
set themeData(ThemeData themeData){
  _themeData = themeData;

  // update UI
  notifyListeners();
}

// toggle Theme
void toggleTheme(){
  if(_themeData==lightMode){
    themeData=darkMode;
  }
  else{
    themeData=lightMode;
  }
}


}