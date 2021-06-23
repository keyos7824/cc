import 'package:cc_mobile/widgets/logo/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'profile_store.dart';
import 'widgets/profile.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ProfileStore>(context);
    return Observer(
      builder: (_) {
        return Provider(
          create: (context) => store,
          child: Scaffold(
            appBar: AppBar(
              title: Logo(),
              centerTitle: true,
              leading: Builder(
                builder: (BuildContext context) {
                  return store.showBackButton
                      ? BackButton(
                          onPressed: store.back,
                        )
                      : SizedBox.shrink();
                },
              ),
            ),
            body: store.isSignedIn ? ProfileWidget() : store.currentPage,
          ),
        );
      },
    );
  }
}
