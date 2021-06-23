import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'signup_store.dart';

class SignupPage extends StatelessWidget {
  final String? initalTitle;
  const SignupPage({Key? key, this.initalTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => SignupStore(initalTitle: initalTitle),
      child: Observer(
        builder: (context) {
          final signupStore = Provider.of<SignupStore>(context);
          return Scaffold(
            appBar: AppBar(
              iconTheme: Theme.of(context).iconTheme,
              backgroundColor: Colors.white,
              title: Text(
                "INSCRIPTION",
                style: TextStyle(color: Colors.black),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: DropdownButton(
                    value: signupStore.selectedTitle,
                    icon: Icon(
                      Icons.arrow_drop_down,
                    ),
                    underline: SizedBox.shrink(),
                    onChanged: (String? newValue) {
                      signupStore.changePage(newValue);
                    },
                    items: signupStore.titles
                        .map<DropdownMenuItem<String>>(
                          (item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(
                              item,
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
            body: signupStore.currentPage,
          );
        },
      ),
    );
  }
}
