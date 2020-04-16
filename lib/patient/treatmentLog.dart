import 'package:flutter/material.dart';
import 'package:telemed/patient/patienthome.dart';
import 'package:telemed/patient/sideBar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class treatmentLog extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Log(),
    );
  }
}


class Log extends StatefulWidget{
  Log({this.plog});
  final String plog;

  @override
  _Log createState() =>new _Log(palog: this.plog);
}

class _Log extends State<Log>{
  _Log({this.palog});

  String tlog= "";
  String palog= "";
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Treatment Log'),
        backgroundColor: Color(0xFF21BFBD),
      ),
      body: Container(
        color: Color(0xFFE0F7FA),
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0,right: 40.0,bottom: 40.0,left: 50.0),
          child: StreamBuilder(
            stream: Firestore.instance.collection('treatlog').where('log', isEqualTo: this.palog).snapshots(),
            builder: (context, snapshot){
              if(!snapshot.hasData)
                return Text("Loading Please Waite...");
              return ListView.builder(
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index){
                  DocumentSnapshot ds = snapshot.data.documents[0];
                  this.tlog = ds['log'];
                  return
                    Text(
                      ds['log'],
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}