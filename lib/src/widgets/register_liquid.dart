import 'dart:async';

import 'package:bold_app/src/pages/auth/register.dart';
import 'package:bold_app/src/pages/auth/register_three.dart';
import 'package:bold_app/src/pages/auth/register_two.dart';
import 'package:flutter/material.dart';

class SamplePage extends StatefulWidget {
  PageController controller = new PageController();

  Future<bool> initializeController() {
    Completer<bool> completer = new Completer<bool>();

    /// Callback called after widget has been fully built
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      completer.complete(true);
    });

    return completer.future;
  } // /initializeController()

  SamplePage({this.controller});

  @override
  _SamplePageState createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: samplePages,
    );
  }
}

List<Widget> samplePages = [
  RegisterForm(),
  RegisterForm2(
    controller: controller,
  ),
  RegisterForm3(
    controller: controller,
  ),
];
