import 'dart:io';

import '../signup_store.dart';
import '../../../widgets/image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ServiceForm extends StatefulWidget {
  ServiceForm({Key? key}) : super(key: key);

  @override
  _ServiceFormState createState() => _ServiceFormState();
}

class _ServiceFormState extends State<ServiceForm> {
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
  late TextEditingController localisationController = TextEditingController();
  late TextEditingController phoneController = TextEditingController();
  late TextEditingController addressController = TextEditingController();
  late TextEditingController emailController = TextEditingController();
  late TextEditingController websiteController = TextEditingController();
  late TextEditingController videoLinkController = TextEditingController();
  late TextEditingController descriptionController = TextEditingController();

  late FocusScopeNode nameNode = FocusScopeNode();
  late FocusScopeNode localisationNode = FocusScopeNode();
  late FocusScopeNode phoneNode = FocusScopeNode();
  late FocusScopeNode addressNode = FocusScopeNode();
  late FocusScopeNode emailNode = FocusScopeNode();
  late FocusScopeNode websiteNode = FocusScopeNode();
  late FocusScopeNode videoLinkNode = FocusScopeNode();
  late FocusScopeNode descriptionNode = FocusScopeNode();

  late Map<String, bool> categories = {
    "famille": false,
    "social": false,
    "santé": false,
    "travail / emploi": false,
    "logement/habita ": false,
    "transport": false,
    "Finance / assurance ": false,
    "Justice": false,
    "Loisir": false,
    "scolarité / éducation ": false,
    "Environement ": false,
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
                        labelText: "Nom du service",
                      ),
                      onTap: () => FocusScope.of(context).requestFocus(nameNode),
                      validator: (_) {
                        if (nameController.value.text.isEmpty) {
                          return 'Ce chanps est requis';
                        }
                        return null;
                      },
                      onFieldSubmitted: (_) {
                        FocusScope.of(context).requestFocus(localisationNode);
                      },
                    ),
                  )
                ],
              ),
              padding,
              TextFormField(
                controller: localisationController,
                focusNode: localisationNode,
                decoration: InputDecoration(
                  labelText: "Localisation du service",
                ),
                validator: (_) {
                        if (nameController.value.text.isEmpty) {
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
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(addressNode);
                },
              ),
              padding,
              TextFormField(
                controller: addressController,
                focusNode: addressNode,
                decoration: InputDecoration(
                  labelText: "Adresse",
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
                  FocusScope.of(context).requestFocus(websiteNode);
                },
              ),
              padding,
              TextFormField(
                controller: websiteController,
                focusNode: websiteNode,
                decoration: InputDecoration(
                  labelText: "Lien du site web",
                ),
                onFieldSubmitted: (_) {
                  FocusScope.of(context).requestFocus(videoLinkNode);
                },
              ),
              padding,
              TextFormField(
                controller: videoLinkController,
                focusNode: videoLinkNode,
                decoration: InputDecoration(
                  labelText: "Lien présentation vidéo",
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
                maxLines: 5,
                onFieldSubmitted: (_) {
                  FocusScope.of(context).unfocus();
                },
              ),
              padding,
              Container(
                width: MediaQuery.of(context).size.width,
                child: Wrap(
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
                        "type": "Service",
                        "nameController": nameController.value.text,
                        "localisationController":
                            localisationController.value.text,
                        "phoneController": phoneController.value.text,
                        "addressController": addressController.value.text,
                        "emailController": emailController.value.text,
                        "websiteController": websiteController.value.text,
                        "videoLinkController": videoLinkController.value.text,
                        "descriptionController":
                            descriptionController.value.text,
                        "selectedCategories": selectedCategories(),
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
