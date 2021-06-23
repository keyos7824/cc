import 'package:mobx/mobx.dart';

import '../../constants.dart';
import '../../models/post.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  _HomeStoreBase() {
    fetch();
  }

  @observable
  List<Post> entitiesPosts = [];

  @observable
  List<Post> partnersPosts = [];

  @observable
  bool fetchingData = false;

  @computed
  bool get fetched => entitiesPosts.isNotEmpty && partnersPosts.isNotEmpty;

  @observable
  String errorMessage = "";

  @computed
  bool get hasError => errorMessage.isNotEmpty;

  @action
  Future<void> fetch() async {
    fetchingData = true;
    if (!await api.canConnect()) {
      errorMessage =
          "Une erreur est survenue, vérifiez que vous etes connecté à internet";
    } else {
      errorMessage = "";
      List rawEntitiesPosts = await api.getEntitiesPosts();
      List rawpartnersPosts = await api.getPartnersPost();

      print("raw entities posts : $rawEntitiesPosts, ${rawEntitiesPosts.isNotEmpty}");
      print("raw partners posts : $rawpartnersPosts, ${rawpartnersPosts.isNotEmpty}");

      fetchingData = false;
      if (rawEntitiesPosts.isNotEmpty && rawpartnersPosts.isNotEmpty) {
        entitiesPosts =
            rawEntitiesPosts.map<Post>((item) => Post.fromJson(item),).toList();
        partnersPosts =
            rawpartnersPosts.map<Post>((item) => Post.fromJson(item),).toList();
        print("fetched");
      } else {
        errorMessage = "Something went wrong";
      }
    }
  }
}
