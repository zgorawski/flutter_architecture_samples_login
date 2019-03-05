import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'scopedModelModel.dart';

class LoginScreen {

    Widget loginScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Text("ScopedModel test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScopedModelDescendant<LoginModel>(
                builder: (context, child, model) =>
                    TextField(onChanged: model.onLoginChange)),
            SizedBox(height: 16),
            ScopedModelDescendant<LoginModel>(
                builder: (context, child, model) => TextField(
                    onChanged: model.onPasswordChange, obscureText: true)),
            SizedBox(height: 16),
            ScopedModelDescendant<LoginModel>(builder: (context, child, model) {
              var rules = model.validationRules
                  .map((validatiorRule) => Text(validatiorRule.rule,
                      style: TextStyle(
                          color: validatiorRule.isFulfilled
                              ? Colors.blue
                              : Colors.red)))
                  .toList();
              return Column(children: rules);
            }),
            SizedBox(height: 32),
            ScopedModelDescendant<LoginModel>(
                builder: (context, child, model) => RaisedButton(
                      onPressed: model.onLoginButtonPress,
                      child: Text("LOGIN"),
                    ))
          ],
        ),
      ),
    );
  }
}