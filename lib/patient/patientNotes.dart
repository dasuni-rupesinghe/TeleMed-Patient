
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: camel_case_types
class patientNotes extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return new MaterialApp(
     home: new Notes(),
   );
  }
}


class Notes extends StatefulWidget{
  Notes({this.pnote});
  final String pnote;

  @override
  _Notes createState() =>new _Notes(panote: this.pnote);

}


class _Notes extends State<Notes>{
  _Notes({this.panote});

  String Note="";
  String panote="";
  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return new Scaffold(
   appBar: new AppBar(
     title: new Text('Special Notes'),
     backgroundColor: Color(0xFF21BFBD),
   ),
     body: Container(
       color: Color(0xFFE0F7FA),
       child: Padding(
         padding: const EdgeInsets.only(top: 40.0,right: 40.0,bottom: 40.0,left: 50.0),
     child: StreamBuilder(
       //where('note', isEqualTo: this.panote)
       stream: Firestore.instance.collection('userdoc').snapshots(),
       builder: (context, snapshot){
         if(!snapshot.hasData)
           return Text("Loading Please Waite...");
         return ListView.builder(
           itemCount: snapshot.data.documents.length,
           itemBuilder: (context, index){
             DocumentSnapshot ds = snapshot.data.documents[0];
           this.Note = ds['note'];
             return
             Text(
               ds['note'],
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
