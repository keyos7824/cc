import 'package:cc_mobile/widgets/logo/logo.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Logo(),
      ),
      body: Container(
        child: Center(
          child: Text("Aucun nouveau message"),
        ),
      ),
    );
  }
}
