import 'dart:convert';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class NewPostPage extends StatelessWidget {
  NewPostPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        // return SingleChildScrollView(
        //   physics: BouncingScrollPhysics(),
        //   child: Column(
        //     children: [
        //       store.images.isEmpty
        //           ? SizedBox.shrink()
        //           : Carousel(
        //               images: [],
        //               onChanged: (int index) {
        //                 store.currentImageIndex = index;
        //               },
        //             ),
        //       Row(
        //         children: [
        //           Expanded(
        //             child: TextButton(
        //               child: Text("Ajouter une image"),
        //               onPressed: () async {
        //                 UploadType? type = await uploadPicker(context);
        //                 FileUploader uploader = FileUploader();
        //                 switch (type) {
        //                   case UploadType.FromFile:
        //                     await uploader.getImageFile();
        //                     break;
        //                   case UploadType.FromCamera:
        //                     await uploader.getImageCamera();
        //                     break;
        //                   case null:
        //                     return;
        //                 }
        //                 if (uploader.image != null) {
        //                   String converted = base64Encode(
        //                     uploader.image!.readAsBytesSync(),
        //                   );
        //                   store.images!.add(converted);
        //                   setState(() {});
        //                 }
        //               },
        //             ),
        //           ),
        //           SizedBox(
        //             width: 15,
        //           ),
        //           Expanded(
        //             child: TextButton(
        //               child: Text("Supprimer l'image"),
        //               onPressed: () {
        //                 setState(() {
        //                   store.removeImage();
        //                 });
        //               },
        //             ),
        //           ),
        //         ],
        //       ),
        //       TextFormField(
        //         decoration: InputDecoration(
        //           labelText: "Titre",
        //         ),
        //         onChanged: (String? value) {
        //           store.title = value;
        //         },
        //       ),
        //       TextFormField(
        //         decoration: InputDecoration(
        //           labelText: "Description",
        //         ),
        //         onChanged: (String? value) {
        //           store.description = value;
        //         },
        //       ),
        //       TextFormField(
        //         decoration: InputDecoration(
        //           labelText: "Lien vidéo",
        //         ),
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Text(
        //             formatDate(
        //               store.dateTime,
        //               [dd, '-', m, '-', yyyy, ' à ', HH, ':', nn],
        //             ),
        //           ),
        //           TextButton(
        //             child: Text("Date et Heures"),
        //             onPressed: () async {
        //               DateTime now = DateTime.now();
        //               DateTime? datePicked = await showDatePicker(
        //                 context: context,
        //                 initialDate: now,
        //                 firstDate: now,
        //                 lastDate: DateTime(2100),
        //               );

        //               TimeOfDay? timePicked = await showTimePicker(
        //                   context: context, initialTime: TimeOfDay.now());

        //               if (datePicked != null) {
        //                 // comnbine date and time from the 2 pickers
        //                 if (timePicked != null) {
        //                   store.dateTime = DateTime(
        //                     datePicked.year,
        //                     datePicked.month,
        //                     datePicked.day,
        //                     timePicked.hour,
        //                     timePicked.minute,
        //                   );
        //                 } else {
        //                   store.dateTime = datePicked;
        //                 }
        //               }
        //             },
        //           )
        //         ],
        //       )
        //     ],
        //   ),
        // );

        return Center(child: Text("New post page here"));
      },
    );
  }
}
