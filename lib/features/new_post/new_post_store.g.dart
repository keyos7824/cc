// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewPostStore on _NewPostStoreBase, Store {
  final _$imagesAtom = Atom(name: '_NewPostStoreBase.images');

  @override
  List<Image>? get images {
    _$imagesAtom.reportRead();
    return super.images;
  }

  @override
  set images(List<Image>? value) {
    _$imagesAtom.reportWrite(value, super.images, () {
      super.images = value;
    });
  }

  @override
  String toString() {
    return '''
images: ${images}
    ''';
  }
}
