import 'package:cc_mobile/constants.dart';

import 'forms/association_form.dart';
import 'forms/citizen_form.dart';
import 'forms/commerce_form.dart';
import 'forms/service_form.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'signup_store.g.dart';

class SignupStore = _SignupStoreBase with _$SignupStore;

abstract class _SignupStoreBase with Store {
  final String? initalTitle;

  _SignupStoreBase({this.initalTitle}) {
    if (initalTitle != null) {
      selectedTitle = initalTitle!;
    }
  }

  late Map<String, Widget> pages = {
    'Citoyen': CitizenForm(),
    'Association': AssociationForm(),
    'Commerce': CommerceForm(),
    'Service aux citoyens': ServiceForm(),
  };

  @computed
  Widget? get currentPage => pages[selectedTitle];

  @observable
  late List titles = [
    'Citoyen',
    'Association',
    'Commerce',
    'Service aux citoyens',
  ];

  @observable
  late String selectedTitle = titles[2];

  @action
  void changePage(String? newpage) {
    selectedTitle = newpage!;
  }

  void signin(Map data) {
    api.signup(data);
    print(data);
  }
}


