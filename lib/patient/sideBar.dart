import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:telemed/otherWidgetsAndScreen/backBtn.dart';
import 'package:telemed/patient/patientNotes.dart';
import 'package:telemed/patient/patienthome.dart';
import 'package:telemed/patient/treatmentLog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telemed/animations/fadeAnimation.dart';
import 'package:telemed/animations/bottomAnimation.dart';
import 'package:telemed/patient/logout.dart';


class SideBar extends StatelessWidget{
  @override

  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Color(0xFF21BFBD),
            child: Center(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 70,
                    margin: EdgeInsets.only(top: 35),
                    child: Text(
                      'All Categories',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
         Container(
           child: Text(
             '\t\t',
             style: TextStyle(
               fontSize: 22,
             ),
           ),
         ),
         ListTile(
           leading: Icon(Icons.favorite,
             color: Colors.blueGrey,
             size: 30.0,
           ),

           title: Text(
             'Notes',
             style: TextStyle(
               fontSize: 20,
             ),
           ),
           onTap: (){
             Navigator.push(context, new MaterialPageRoute(
                 builder: (BuildContext context) => new Notes())
             );
           },
         ),
          ListTile(
            leading: Icon(Icons.favorite,
              color: Colors.pink,
              size: 30.0,
            ),
            title: Text(
              'Treatment Log',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: (){
              Navigator.push(context, new MaterialPageRoute(
                  builder: (BuildContext context) => new Log())
              );
            },
          ),
          Container(
            width: 200,
            height: 200,
            margin: EdgeInsets.only(bottom: 45),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage("assets/4282.png"),
                       fit: BoxFit.fill
              )
            ),
           // child: Image(image: AssetImage("assets/4282.png")),
          ),
          ListTile(
            leading: Icon(Icons.arrow_back
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: (){

              return ( showDialog(
                  context: context,
              barrierDismissible: false,
                  builder: (context) =>
              new AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                title: new Text(
                  "Logout Application",
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
              )) ??
                  false;
            },

//            onTap: (){
//              Navigator.push(context, new MaterialPageRoute(
//                  builder: (BuildContext context) => new logout())
//              );
//            },
          )
        ],
      ),
    );
    return null;
  }

}


