import 'package:cc_mobile/features/calendar/calendar_page.dart';
import 'package:cc_mobile/features/favorites/favourites_page.dart';
import 'package:cc_mobile/features/messages/messages_page.dart';

import '../home/home_page.dart';
import '../profile/profile_page.dart';
import '../settings/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';
part 'app_store.g.dart';

class AppStore = _AppStoreBase with _$AppStore;

abstract class _AppStoreBase with Store {
  final List<Widget> pages = [
    HomePage(),
    MessagesPage(),
    FavouritesPage(),
    CalendarPage(),
    ProfilePage(),
    // SettingsPage(),
  ];

  @observable
  int currentIndex = 0;

  @action
  void navigate(int index) {
    if (index < pages.length) {
      currentIndex = index;
    } else {
      Fluttertoast.showToast(msg: "wtf");
    }
  }
}