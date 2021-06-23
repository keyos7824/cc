import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../widgets/image_picker/image_picker.dart';
import '../signup_store.dart';

class AssociationForm extends StatefulWidget {
  AssociationForm({Key? key}) : super(key: key);

  @override
  _AssociationFormState createState() => _AssociationFormState();
}

class _AssociationFormState extends State<AssociationForm> {
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

  List<String> selectedCategories() {
    List<String> selecteds = [];

    for (var key in categories.keys) {
      if (categories[key] == true) {
        selecteds.add(key);
      }
    }

    return selecteds;
  }

  File? image;

  late TextEditingController nameController = TextEditingController();
  late TextEditingController rnaController = TextEditingController();
  late TextEditingController addressController = TextEditingController();
  late TextEditingController postcodeController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController websiteController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();
  late TextEditingController videoLinkController = TextEditingController();
  late TextEditingController passwordController = TextEditingController();
  late TextEditingController membersNumberController = TextEditingController();
  late TextEditingController passwordConfirmationController =
      TextEditingController();

  late FocusScopeNode nameNode = FocusScopeNode();
  late FocusScopeNode rnaNode = FocusScopeNode();
  late FocusScopeNode addressNode = FocusScopeNode();
  late FocusScopeNode postcodeNode = FocusScopeNode();
  late FocusScopeNode phoneNode = FocusScopeNode();
  late FocusScopeNode emailNode = FocusScopeNode();
  late FocusScopeNode websiteNode = FocusScopeNode();
  late FocusScopeNode descriptionNode = FocusScopeNode();
  late FocusScopeNode videoLinkNode = FocusScopeNode();
  late FocusScopeNode passwordNode = FocusScopeNode();
  late FocusScopeNode passwordConfirmationNode = FocusScopeNode();
  late FocusScopeNode membersNumberNode = FocusScopeNode();

  late Map<String, bool> categories = {
    "spectacle": false,
    "Loisir": false,
    "action humanitaire et caritative ": false,
    "action social ": false,
    "Santé": false,
    "écologie / végetal ": false,
    "économie /emploi": false,
    "Education / formation ": false,
    "Sport ": false,
    "cultuel ": false,
  };

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
                      controller: nameController,
                      focusNode: nameNode,
                      decoration: InputDecoration(
                        labelText: "Nom de l'association",
                      ),
                      validator: (_) {
                        if (nameController.value.text.isEmpty) {
                          return 'Ce chanps est requis';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(rnaNode);
                      },
                    ),
                  )
                ],
              ),
              padding,
              TextFormField(
                controller: rnaController,
                focusNode: rnaNode,
                decoration: InputDecoration(
                  labelText: "RNA",
                ),
                validator: (_) {
                  if (rnaController.value.text.isEmpty) {
                    return 'Ce chanps est requis';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(addressNode);
                },
              ),
              padding,
              TextFormField(
                controller: addressController,
                focusNode: addressNode,
                decoration: InputDecoration(
                  labelText: "Adress de l'association",
                ),
                maxLines: 4,
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
                validator: (_) {
                  if (postcodeController.value.text.isEmpty) {
                    return 'Ce chanps est requis';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(phoneNode);
                },
              ),
              padding,
              TextFormField(
                controller: phoneController,
                focusNode: phoneNode,
                decoration: InputDecoration(
                  labelText: "Téléphone",
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Ce chanps est requis';
                  }
                  return null;
                },
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(websiteNode);
                },
              ),
              padding,
              TextFormField(
                controller: websiteController,
                focusNode: websiteNode,
                decoration: InputDecoration(
                  labelText: "Site internet",
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(descriptionNode);
                },
              ),
              padding,
              TextFormField(
                controller: descriptionController,
                focusNode: descriptionNode,
                decoration: InputDecoration(
                  labelText: "Description",
                ),
                maxLines: 10,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(videoLinkNode);
                },
              ),
              padding,
              TextFormField(
                controller: videoLinkController,
                focusNode: videoLinkNode,
                decoration: InputDecoration(
                  labelText: "Lien vidéo de présentation",
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(membersNumberNode);
                },
              ),
              padding,
              TextFormField(
                controller: membersNumberController,
                focusNode: membersNumberNode,
                decoration: InputDecoration(
                  labelText: "Estimation du nombre de membres",
                ),
                keyboardType: TextInputType.number,
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
                    return 'Ce chanps est requis';
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
                  FocusScope.of(context).unfocus();
                },
              ),
              padding,
              Wrap(
                direction: Axis.horizontal,
                alignment: WrapAlignment.spaceBetween,
                runAlignment: WrapAlignment.spaceBetween,
                children: categories.keys
                    .map<Widget>(
                      (String key) => ActionChip(
                        label: Text(
                          key,
                          style: TextStyle(fontSize: 13),
                        ),
                        backgroundColor: this.categories[key]!
                            ? Colors.blue[200]
                            : Colors.grey[350],
                        onPressed: () {
                          setState(() {
                            categories[key] = !categories[key]!;
                          });
                        },
                      ),
                    )
                    .toList(),
              ),
              padding,
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    signupStore.signin({
                      "type": "association",
                      "name": nameController.value.text,
                      "rna": rnaController.value.text,
                      "address": addressController.value.text,
                      "postcode": postcodeController.value.text,
                      "phone": phoneController.value.text,
                      "email": emailController.value.text,
                      "website": websiteController.value.text,
                      "description": descriptionController.value.text,
                      "videoLink": videoLinkController.value.text,
                      "password": passwordController.value.text,
                      "membersNumber": membersNumberController.value.text,
                      "passwordConfirmation":
                          passwordConfirmationController.value.text,
                      "selectedCategories": selectedCategories()
                    });
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
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
