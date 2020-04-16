import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class logout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    Future<bool> _onWillPop() async {
      return (await showDialog(
        context: context,
        builder: (context) =>
        new AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)),
          title: new Text(
            "Exit Application",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          content: new Text("Are You Sure?"),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            FlatButton(
              shape: StadiumBorder(),
              color: Colors.white,
              child: new Text(
                "No",
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              shape: StadiumBorder(),
              color: Colors.white,
              child: new Text(
                "Yes",
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                exit(0);
              },
            ),
          ],
        ),
      ))
      ??
          false;
    }
    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: height * 0.065,
              ),
            ],
          ),
        ),
      ),
    );

  }
}
