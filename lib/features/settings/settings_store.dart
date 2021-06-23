import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStoreBase with _$SettingsStore;

abstract class _SettingsStoreBase with Store {
  static const primaryColor = Color(0xff0D4088);
  static const secondaryColor = Color(0xffC41212);

  static ThemeData primary = ThemeData(
    primaryColor: primaryColor,
    // colorScheme: ColorScheme.fromSwatch(
    //   primarySwatch: Colors.blue,
    //   primaryColorDark: primaryColor,
    //   accentColor: secondaryColor,
    //   cardColor: Colors.white,
    //   backgroundColor: Colors.grey.shade200,
    //   errorColor: Colors.red,
    //   brightness: Brightness.light,
    // ),
    accentColor: secondaryColor,
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      headline2: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      headline3: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderSide: BorderSide(color: secondaryColor)
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      titleTextStyle: TextStyle(
        color: Colors.black,
      ),
      iconTheme: IconThemeData(
        color: Colors.black,
      )
    ),
    tabBarTheme: TabBarTheme(
      unselectedLabelColor: Colors.grey.shade800,
      labelColor: primaryColor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: primaryColor,
      unselectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(
        color: primaryColor,
      ),
      unselectedLabelStyle: TextStyle(color: Colors.black),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(primaryColor)
      )
    ),
  );

  static ThemeData secondary = ThemeData(
    brightness: Brightness.dark,
    textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        headline2: TextStyle(
            fontSize: 22, fontWeight: FontWeight.normal, color: Colors.white),
        headline3: TextStyle(
            fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white)),
  );

  @observable
  List<ThemeData> themes = [
    primary,
    secondary,
  ];

  @observable
  ThemeData currentTheme = _getTheme();

  static ThemeData _getTheme() {
    return primary;
  }
}
