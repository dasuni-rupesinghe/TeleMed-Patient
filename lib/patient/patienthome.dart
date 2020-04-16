import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:telemed/otherWidgetsAndScreen/RepaetCode.dart';
import 'package:telemed/otherWidgetsAndScreen/patientHomeIcon.dart';
import 'package:telemed/patient/sideBar.dart';


class PatientHome extends StatefulWidget{

  @override
  _PatientHomeState createState() => _PatientHomeState();
  }

class _PatientHomeState extends State<PatientHome> {

  @override
  Widget build(BuildContext context) {
    var width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF21BFBD),
        ),
        drawer: SideBar(),
        body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child:
                      RepeatCode(
                          colour: Color(0xFFEDE7F6),
                          onpress: () {},
                          CardChild: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: IconContent(
                                icon: Icons.account_circle,
                                text: 'Ms.Dasuni Rupesinge \n Age: 20',
                              ),
                            ),
                          )
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child:
                      RepeatCode(
                        colour: Color(0xFFEDE7F6),
                        onpress: () {},
                        CardChild: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),

                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 60.0,
                                  child: Image(image: AssetImage(
                                      'assets/heart-electrocardiography-pulse-png-favpng-m0jLLPhW0C7nrsW4M9BqDztvT_t.jpg')),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(4.0)
                                ),
                                Text(
                                  'Heart',
                                  style: TextStyle(

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child:
                      RepeatCode(
                        colour: Color(0xFFEDE7F6),
                        onpress: () {},
                        CardChild: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),

                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 60.0,
                                  child: Image(
                                      image: AssetImage('assets/images.jpg')),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(4.0)
                                ),
                                Text(
                                  'Temperature',
                                  style: TextStyle(

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: <Widget>[
                    Expanded(
                      child:
                      RepeatCode(
                        colour: Color(0xFFEDE7F6),
                        onpress: () {},
                        CardChild: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(7.0),

                            child: Column(
                              children: <Widget>[
                                Container(
                                  width: 60.0,
                                  child: Image(image: AssetImage(
                                      'assets/blood-pressure-measurement-icon-heart-and-sphygm-vector-13316931.jpg')),
                                ),
                                Padding(
                                    padding: const EdgeInsets.all(4.0)
                                ),
                                Text(
                                  'Blood Pressure',
                                  style: TextStyle(

                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )

        )
    );
  }
}

//class _PatientHomeState extends State<PatientHome>
//{
//  List<Posts> postsList = [];
//
//  @override
//  void initState() {
// //   super.initState();
//
//    DatabaseReference postsRef = FirebaseDatabase.instance.reference();
//    postsRef.child("treatlog").once().then((DataSnapshot snap) {
//      var keys = snap.value.keys;
//      var data = snap.value;
//      postsList.clear();
//      for(var key in keys){
//        Posts d = Posts(
//            data[key]['bpm'],
//            data[key]['heart'],
//            data[key]['temp']
//        );
//        postsList.add(d);
//      }
//      setState(() {
//        print('Length : ${postsList.length}');
//      });
//    });
//  }
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      //
//      appBar: AppBar(
//        backgroundColor: Color(0xFF21BFBD),
//      ),
//      drawer: SideBar(),
//      body: Container(
//        child: postsList.length == 0
//            ? Text('No Data') :
//        ListView.builder(
//          itemCount: postsList.length,
//          itemBuilder: (_, index) {
//            return UI(
//                postsList[index].bpm,
//                postsList[index].heart,
//                postsList[index].temp
//            );
//          },
//        ),
//      ),
//    );
//  }
//  Widget UI(String bpm, String heart, String temp)
//  {
//    return Card(
//      elevation: 10.0,
//      child: Container(
//        padding: EdgeInsets.all(20.0),
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: <Widget>[
//            Text('pressure: $bpm'),
//            Text('pulse: $heart'),
//            Text('temper: $temp'),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
