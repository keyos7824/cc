// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupStore on _SignupStoreBase, Store {
  Computed<Widget?>? _$currentPageComputed;

  @override
  Widget? get currentPage =>
      (_$currentPageComputed ??= Computed<Widget?>(() => super.currentPage,
              name: '_SignupStoreBase.currentPage'))
          .value;

  final _$titlesAtom = Atom(name: '_SignupStoreBase.titles');

  @override
  List<dynamic> get titles {
    _$titlesAtom.reportRead();
    return super.titles;
  }

  @override
  set titles(List<dynamic> value) {
    _$titlesAtom.reportWrite(value, super.titles, () {
      super.titles = value;
    });
  }

  final _$selectedTitleAtom = Atom(name: '_SignupStoreBase.selectedTitle');

  @override
  String get selectedTitle {
    _$selectedTitleAtom.reportRead();
    return super.selectedTitle;
  }

  @override
  set selectedTitle(String value) {
    _$selectedTitleAtom.reportWrite(value, super.selectedTitle, () {
      super.selectedTitle = value;
    });
  }

  final _$_SignupStoreBaseActionController =
      ActionController(name: '_SignupStoreBase');

  @override
  void changePage(String? newpage) {
    final _$actionInfo = _$_SignupStoreBaseActionController.startAction(
        name: '_SignupStoreBase.changePage');
    try {
      return super.changePage(newpage);
    } finally {
      _$_SignupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
titles: ${titles},
selectedTitle: ${selectedTitle},
currentPage: ${currentPage}
    ''';
  }
}
