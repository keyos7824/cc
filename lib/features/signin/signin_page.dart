import 'package:cc_mobile/features/signup/signup_page.dart';
import 'package:cc_mobile/features/signup/widgets/picker.dart';

import '../profile/profile_store.dart';
import '../../widgets/logo/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:sign_button/create_button.dart';
import 'package:sign_button/sign_button.dart';

import 'signin_store.dart';
import 'widget/slider.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);

  final store = SigninStore();

  late final FocusScopeNode emailNode = FocusScopeNode();
  late final FocusScopeNode passwordNode = FocusScopeNode();

  @override
  Widget build(BuildContext context) {
    final profileStore = Provider.of<ProfileStore>(context);
    return Observer(builder: (_) {
      return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  suffixIcon: Icon(Icons.email),
                ),
                onChanged: (String? value) {
                  store.email = value!;
                },
                onSubmitted: (_) {
                  FocusScope.of(context).requestFocus(passwordNode);
                },
                focusNode: emailNode,
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "Password", suffixIcon: Icon(Icons.password)),
                onChanged: (String? value) {
                  store.password = value!;
                },
                onSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                  store.signin();
                },
                focusNode: passwordNode,
              ),
              SizedBox(
                height: 10,
              ),
              SignInButton(
                buttonType: ButtonType.google,
                imagePosition: ImagePosition.right,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                      color: Theme.of(context).primaryColor, width: 1),
                      borderRadius: BorderRadius.circular(5),
                ),
                btnTextColor: Theme.of(context).primaryColor,
                width: MediaQuery.of(context).size.width,
                onPressed: () async {
                  // GoogleServices googleServices = GoogleServices();
                  // await googleServices.handleSignIn();
                  // await Fluttertoast.showToast(
                  //   msg: "accessToken: ${googleServices.accessToken}",
                  //   textColor: Theme.of(context).primaryColor,
                  // );
                },
              ),
              SizedBox(
                height: 10,
              ),
              SliderButton(
                text: 'Se connecter',
                icon: Icons.login,
                onComplete: () {
                  profileStore.getUserData();
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    child: Text("Mot de passe oublié"),
                    onPressed: () {
                      Fluttertoast.showToast(
                          msg: "Un email de récuperation à été envoyé");
                    },
                  ),
                  TextButton(
                    child: Text("Créer un compte"),
                    onPressed: () async {
                      String? initialTitle = await signupChoicePicker(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => SignupPage(
                            initalTitle: initialTitle,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    });
  }
}
