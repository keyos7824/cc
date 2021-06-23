import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/profile/profile_store.dart';

class LeadingButton extends StatelessWidget {
  const LeadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileStore = Provider.of<ProfileStore>(context);
    return profileStore.isSignedIn
        ? IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          )
        : SizedBox.shrink();
  }
}
