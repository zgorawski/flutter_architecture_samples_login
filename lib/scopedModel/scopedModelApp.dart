import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'scopedModelModel.dart';
import 'scopedModelLoginScreen.dart';

class ScopedModelApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ScopedModel test',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: ScopedModel<LoginModel>(
          child: LoginScreen().loginScreen(), model: LoginModel("", "", false)),
    );
  }
}