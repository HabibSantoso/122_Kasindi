import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kasindi/controller/controller_user.dart';
import 'package:kasindi/view/page/home.dart';
import 'package:kasindi/view/page/login.dart';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: ControllerUser().authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return Login();
          }
        });
  }
}
