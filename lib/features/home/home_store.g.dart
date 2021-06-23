// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  Computed<bool>? _$fetchedComputed;

  @override
  bool get fetched => (_$fetchedComputed ??=
          Computed<bool>(() => super.fetched, name: '_HomeStoreBase.fetched'))
      .value;
  Computed<bool>? _$hasErrorComputed;

  @override
  bool get hasError => (_$hasErrorComputed ??=
          Computed<bool>(() => super.hasError, name: '_HomeStoreBase.hasError'))
      .value;

  final _$entitiesPostsAtom = Atom(name: '_HomeStoreBase.entitiesPosts');

  @override
  List<Post> get entitiesPosts {
    _$entitiesPostsAtom.reportRead();
    return super.entitiesPosts;
  }

  @override
  set entitiesPosts(List<Post> value) {
    _$entitiesPostsAtom.reportWrite(value, super.entitiesPosts, () {
      super.entitiesPosts = value;
    });
  }

  final _$partnersPostsAtom = Atom(name: '_HomeStoreBase.partnersPosts');

  @override
  List<Post> get partnersPosts {
    _$partnersPostsAtom.reportRead();
    return super.partnersPosts;
  }

  @override
  set partnersPosts(List<Post> value) {
    _$partnersPostsAtom.reportWrite(value, super.partnersPosts, () {
      super.partnersPosts = value;
    });
  }

  final _$fetchingDataAtom = Atom(name: '_HomeStoreBase.fetchingData');

  @override
  bool get fetchingData {
    _$fetchingDataAtom.reportRead();
    return super.fetchingData;
  }

  @override
  set fetchingData(bool value) {
    _$fetchingDataAtom.reportWrite(value, super.fetchingData, () {
      super.fetchingData = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_HomeStoreBase.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$fetchAsyncAction = AsyncAction('_HomeStoreBase.fetch');

  @override
  Future<void> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
entitiesPosts: ${entitiesPosts},
partnersPosts: ${partnersPosts},
fetchingData: ${fetchingData},
errorMessage: ${errorMessage},
fetched: ${fetched},
hasError: ${hasError}
    ''';
  }
}
