import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/image_picker/image_picker.dart';
import '../signup_store.dart';

class CitizenForm extends StatefulWidget {
  CitizenForm({Key? key}) : super(key: key);

  @override
  _CitizenFormState createState() => _CitizenFormState();
}

class _CitizenFormState extends State<CitizenForm> {
  Future<void> uploadImage(BuildContext context) async {
    UploadType? type = await uploadPicker(context);
    FileUploader uploader = FileUploader();
    switch (type) {
      case UploadType.FromFile:
        await uploader.getImageFile();
        break;
      case UploadType.FromCamera:
        await uploader.getImageCamera();
        break;
      case null:
        return;
    }
    if (uploader.image != null) setState(() => image = uploader.image);
  }

  Widget imageIfUploaded(context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).primaryColor,
        image: image == null
            ? null
            : DecorationImage(
                fit: BoxFit.cover,
                image: FileImage(image!),
              ),
      ),
      height: 100,
      child:
          image == null ? Icon(Icons.file_upload, color: Colors.white) : null,
    );
  }

  File? image;

  late TextEditingController usernameController = TextEditingController();
  late TextEditingController firstnameController = TextEditingController();
  late TextEditingController lastnameController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController passwordConfirmationController =
      TextEditingController();
  late TextEditingController postcodeController = TextEditingController();
  late TextEditingController activityController = TextEditingController();
  late TextEditingController ageController = TextEditingController();

  late FocusScopeNode usernameNode = FocusScopeNode();
  late FocusScopeNode firstnameNode = FocusScopeNode();
  late FocusScopeNode lastnameNode = FocusScopeNode();
  late FocusScopeNode emailNode = FocusScopeNode();
  late FocusScopeNode passwordNode = FocusScopeNode();
  late FocusScopeNode passwordConfirmationNode = FocusScopeNode();
  late FocusScopeNode postcodeNode = FocusScopeNode();
  late FocusScopeNode activityNode = FocusScopeNode();
  late FocusScopeNode ageNode = FocusScopeNode();

  late String? genre = "Homme";
  late String? language = "Français";

  List<String> genreOptions = <String>[
    "Homme",
    "Femme",
    "Non-binaire",
    "Autre",
    "Ne préfère pas préciser",
  ];

  List<String> languageOptions = <String>[
    "Français",
    "Arabe",
    "Turk",
    "Roumain",
    "Anglais",
  ];

  final _formKey = GlobalKey<FormState>();

  Widget padding = SizedBox(
    height: 20,
  );

  @override
  Widget build(BuildContext context) {
    final signupStore = Provider.of<SignupStore>(context);
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 35,
                    child: InkWell(
                      onTap: () async {
                        await uploadImage(context);
                      },
                      child: imageIfUploaded(context),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 75,
                    child: TextFormField(
                      controller: usernameController,
                      focusNode: usernameNode,
                      decoration: InputDecoration(
                        labelText: "Pseudonyme",
                      ),
                      validator: (_) {
                        if (usernameController.value.text.isEmpty) {
                          return 'Ce chanps est requis';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(firstnameNode);
                      },
                    ),
                  )
                ],
              ),
              padding,
              TextFormField(
                controller: firstnameController,
                focusNode: firstnameNode,
                decoration: InputDecoration(
                  labelText: "Prénom",
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(lastnameNode);
                },
              ),
              padding,
              TextFormField(
                controller: lastnameController,
                focusNode: lastnameNode,
                decoration: InputDecoration(
                  labelText: "Nom de famille",
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(emailNode);
                },
              ),
              padding,
              TextFormField(
                controller: emailController,
                focusNode: emailNode,
                decoration: InputDecoration(
                  labelText: "Email",
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Ce chanps est requis';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(passwordNode);
                },
              ),
              padding,
              TextFormField(
                controller: passwordController,
                focusNode: passwordNode,
                decoration: InputDecoration(
                  labelText: "Mot de passe",
                ),
                obscureText: true,
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Entrez du texte';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(passwordConfirmationNode);
                },
              ),
              padding,
              TextFormField(
                controller: passwordConfirmationController,
                focusNode: passwordConfirmationNode,
                decoration: InputDecoration(
                  labelText: "Confirmation du mot de passe",
                ),
                obscureText: true,
                validator: (String? value) {
                  if (passwordController.text !=
                      passwordConfirmationController.text) {
                    return "Les mots de passe ne sont pas égaux";
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(postcodeNode);
                },
              ),
              padding,
              TextFormField(
                controller: postcodeController,
                focusNode: postcodeNode,
                decoration: InputDecoration(
                  labelText: "Code postal",
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(activityNode);
                },
              ),
              padding,
              TextFormField(
                controller: activityController,
                focusNode: activityNode,
                decoration: InputDecoration(
                  labelText: "Activité professionel",
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(ageNode);
                },
              ),
              padding,
              TextFormField(
                controller: ageController,
                focusNode: ageNode,
                decoration: InputDecoration(
                  labelText: "Age",
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                },
              ),
              padding,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: DropdownButton<String>(
                      value: genre,
                      items: genreOptions.map((String item) {
                        return DropdownMenuItem(
                          child: Text(item),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() => genre = newValue!);
                      },
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    flex: 1,
                    child: DropdownButton<String>(
                      value: language,
                      items: languageOptions.map((String item) {
                        return DropdownMenuItem(
                          child: Text(item),
                          value: item,
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() => language = newValue!);
                      },
                    ),
                  ),
                ],
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      signupStore.signin({
                        "type": "Citizen",
                        "username": usernameController.text,
                        "firstname": firstnameController.text,
                        "lastname": lastnameController.text,
                        "email": emailController.text,
                        "password": passwordController.text,
                        "passwordConfirmation":
                            passwordConfirmationController.text,
                        "postcode": postcodeController.text,
                        "activity": activityController.text,
                        "age": ageController.text,
                        "genre": genre,
                        "language": language,
                      });
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Processing Data'),
                        ),
                      );
                    }
                  },
                  child: Text('Confirmer'),
                ),
              ),
              padding,
            ],
          ),
        ),
      ),
    );
  }
}
