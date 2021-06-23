import 'package:cc_mobile/constants.dart';
import 'package:cc_mobile/models/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobx/mobx.dart';

import '../signin/signin_page.dart';
import 'widgets/signin.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {
  @observable
  User? user;

  @computed
  bool get isSignedIn => user != null;

  @action
  Future<void> getUserData() async {
    var data = await api.myAccount();
    user = User.fromJson(data);
  }

  // navigation
  final List<Widget> _pages = [
    SigninWidget(),
    SigninPage(),
  ];

  void _addToHistory(int index) {
    history.add(index);
  }

  int _popHistory() {
    return history.removeLast();
  }

  void changePage(int newIndex) {
    currentIndex = newIndex;
  }

  @action
  void navigate(int newIndex) {
    if (newIndex < _pages.length && newIndex >= 0) {
      _addToHistory(currentIndex);
      changePage(newIndex);
    } else {
      Fluttertoast.showToast(msg: "wtf have you done");
    }
  }

  @observable
  List<int> history = [];

  @action
  void back() {
    int newIndex = _popHistory();
    changePage(newIndex);
  }

  @observable
  int currentIndex = 0;

  @computed
  Widget get currentPage => _pages[currentIndex];

  @computed
  bool get showBackButton => !isSignedIn && history.isNotEmpty;
}
