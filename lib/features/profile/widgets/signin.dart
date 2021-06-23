import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../profile_store.dart';

class SigninWidget extends StatelessWidget {
  const SigninWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<ProfileStore>(context);

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Vous devez etres connecter pour avoir accès à cette page",
            textAlign: TextAlign.center,
          ),
          TextButton(
            child: Text("Connection"),
            onPressed: () {
              store.navigate(1);
            },
          ),
        ],
      ),
    );
  }
}
