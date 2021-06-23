import 'dart:ui';

import 'package:mobx/mobx.dart';
part 'new_post_store.g.dart';

class NewPostStore = _NewPostStoreBase with _$NewPostStore;

abstract class _NewPostStoreBase with Store {
  @observable
  List<Image>? images = [];
}