// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStoreBase, Store {
  final _$themesAtom = Atom(name: '_SettingsStoreBase.themes');

  @override
  List<ThemeData> get themes {
    _$themesAtom.reportRead();
    return super.themes;
  }

  @override
  set themes(List<ThemeData> value) {
    _$themesAtom.reportWrite(value, super.themes, () {
      super.themes = value;
    });
  }

  final _$currentThemeAtom = Atom(name: '_SettingsStoreBase.currentTheme');

  @override
  ThemeData get currentTheme {
    _$currentThemeAtom.reportRead();
    return super.currentTheme;
  }

  @override
  set currentTheme(ThemeData value) {
    _$currentThemeAtom.reportWrite(value, super.currentTheme, () {
      super.currentTheme = value;
    });
  }

  @override
  String toString() {
    return '''
themes: ${themes},
currentTheme: ${currentTheme}
    ''';
  }
}
