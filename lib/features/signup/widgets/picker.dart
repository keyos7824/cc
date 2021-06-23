import 'package:flutter/material.dart';

Future<String?> signupChoicePicker(BuildContext context) async {
  return await showDialog<String?>(
    context: context,
    builder: (context) {
      return SimpleDialog(
        title: const Text("Qui etes vous ?"),
        children: [
          SimpleDialogOption(
            child: const Text("un citoyen"),
            onPressed: () {
              Navigator.pop(
                context,
                "Citoyen",
              );
            },
          ),
          SimpleDialogOption(
            child: const Text("une association"),
            onPressed: () {
              Navigator.pop(
                context,
                "Association",
              );
            },
          ),
          SimpleDialogOption(
            child: const Text("un comerce"),
            onPressed: () {
              Navigator.pop(
                context,
                "Commerce",
              );
            },
          ),
          SimpleDialogOption(
            child: const Text("un service aux citoyens"),
            onPressed: () {
              Navigator.pop(
                context,
                "Service aux citoyens",
              );
            },
          ),
        ],
      );
    },
  );
}
