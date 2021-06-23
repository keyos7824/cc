import 'package:cc_mobile/features/settings/settings_page.dart';
import 'package:cc_mobile/features/profile/profile_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  static const Widget padding = SizedBox(height: 20,);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ProfileStore>(context);
    return Observer(
      builder: (_) {
        return SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                padding,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      minRadius: 50,
                    ),
                    Text(
                      store.user!.username!,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ],
                ),
                padding,
                Text(store.user!.type!),
                Text("${store.user!.firstname!} ${store.user!.lastname!}"),
                Text(store.user!.email!),
                Text(store.user!.activity!),
                Text("${store.user!.age!} ans"),
                Text(store.user!.genre!),
                Text(store.user!.language!),
                Text(store.user!.postcode!),
                padding,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Paramètres",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SettingsPage()
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
