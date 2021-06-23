// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStoreBase, Store {
  Computed<bool>? _$isSignedInComputed;

  @override
  bool get isSignedIn =>
      (_$isSignedInComputed ??= Computed<bool>(() => super.isSignedIn,
              name: '_ProfileStoreBase.isSignedIn'))
          .value;
  Computed<Widget>? _$currentPageComputed;

  @override
  Widget get currentPage =>
      (_$currentPageComputed ??= Computed<Widget>(() => super.currentPage,
              name: '_ProfileStoreBase.currentPage'))
          .value;
  Computed<bool>? _$showBackButtonComputed;

  @override
  bool get showBackButton =>
      (_$showBackButtonComputed ??= Computed<bool>(() => super.showBackButton,
              name: '_ProfileStoreBase.showBackButton'))
          .value;

  final _$userAtom = Atom(name: '_ProfileStoreBase.user');

  @override
  User? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(User? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$historyAtom = Atom(name: '_ProfileStoreBase.history');

  @override
  List<int> get history {
    _$historyAtom.reportRead();
    return super.history;
  }

  @override
  set history(List<int> value) {
    _$historyAtom.reportWrite(value, super.history, () {
      super.history = value;
    });
  }

  final _$currentIndexAtom = Atom(name: '_ProfileStoreBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$getUserDataAsyncAction = AsyncAction('_ProfileStoreBase.getUserData');

  @override
  Future<void> getUserData() {
    return _$getUserDataAsyncAction.run(() => super.getUserData());
  }

  final _$_ProfileStoreBaseActionController =
      ActionController(name: '_ProfileStoreBase');

  @override
  void navigate(int newIndex) {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction(
        name: '_ProfileStoreBase.navigate');
    try {
      return super.navigate(newIndex);
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void back() {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction(
        name: '_ProfileStoreBase.back');
    try {
      return super.back();
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
history: ${history},
currentIndex: ${currentIndex},
isSignedIn: ${isSignedIn},
currentPage: ${currentPage},
showBackButton: ${showBackButton}
    ''';
  }
}
