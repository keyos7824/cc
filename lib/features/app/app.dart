import 'package:flutter/material.dart';
import "package:flutter_mobx/flutter_mobx.dart";
import "package:provider/provider.dart";

import '../profile/profile_store.dart';
import '../settings/settings_store.dart';
import '../signup/signup_page.dart';
import 'app_store.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => SettingsStore(),
        ),
        Provider(
          create: (context) => AppStore(),
        ),
        Provider(
          create: (context) => ProfileStore(),
        ),
      ],
      child: Observer(
        builder: (context) {
          final appstore = context.watch<AppStore>();
          return MaterialApp(
            theme: context.watch<SettingsStore>().currentTheme,
            home: Scaffold(
              body: IndexedStack(
                // Onglet
                children: appstore.pages,
                index: appstore.currentIndex,
              ),
              // body: SignupPage(), //testing single pages easily
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: appstore.currentIndex,
                onTap: (int index) {
                  appstore.navigate(index);
                },
                type: BottomNavigationBarType.fixed,
                items: <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_rounded),
                    label: 'Accueil',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.message_rounded),
                    label: 'Messages',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite_rounded),
                    label: 'Favoris',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.calendar_today_rounded),
                    label: 'Calendrier',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_rounded),
                    label: 'Mon CC',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
