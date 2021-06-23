import 'package:cc_mobile/widgets/logo/logo.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Logo(),
      ),
      body: Center(
        child: Text("Calendrier ici"),
      ),
    );
  }
}
