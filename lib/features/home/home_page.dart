import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../models/post.dart';
import '../../widgets/logo/logo.dart';
import '../../widgets/post/preview.dart';
import 'home_store.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final store = HomeStore();

  Widget postsList(List<Post> posts, context) {
    return store.fetched
        ? ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return PostPreview(post: posts[index]);
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                height: 20,
              );
            },
            itemCount: posts.length,
          )
        : Center(
            child: CircularProgressIndicator(),
          );
  }

  @override
  Widget build(BuildContext context) {
    Widget errorWidget() {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text(
            store.errorMessage,
            style: Theme.of(context).textTheme.bodyText1!.apply(
                  color: Theme.of(context).errorColor,
                ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Observer(
      builder: (context) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
              // title: Text(
              //   "Accueil",
              //   style: Theme.of(context).appBarTheme.titleTextStyle,
              // ),
              title: Logo(),
              bottom: TabBar(
                labelColor: Theme.of(context).tabBarTheme.labelColor,
                unselectedLabelColor:
                    Theme.of(context).tabBarTheme.unselectedLabelColor,
                tabs: [
                  Tab(
                    text: "Actualités",
                  ),
                  Tab(
                    text: "Associations",
                  ),
                  Tab(
                    text: "Commerces",
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                RefreshIndicator(
                  onRefresh: store.fetch,
                  child: store.hasError
                      ? errorWidget()
                      : postsList(store.entitiesPosts, context),
                ),
                RefreshIndicator(
                  onRefresh: store.fetch,
                  child: store.hasError
                      ? errorWidget()
                      : postsList(store.partnersPosts, context),
                ),
                RefreshIndicator(
                  onRefresh: store.fetch,
                  child: store.hasError
                      ? errorWidget()
                      : postsList(store.partnersPosts, context),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
