import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/profile/profile_store.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final profileStore = Provider.of<ProfileStore>(context);
    return profileStore.isSignedIn ? Drawer() : SizedBox.shrink();
  }
}