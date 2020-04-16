import 'package:flutter/material.dart';
import 'package:telemed/animations/bottomAnimation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:telemed/otherWidgetsAndScreen/backBtn.dart';
import 'package:toast/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:telemed/patient/patienthome.dart';



class PatientLogin extends StatefulWidget {
  @override
  _PatientLoginState createState() =>  _PatientLoginState();
}


final _controllerID = TextEditingController();


class _PatientLoginState extends State<PatientLogin>
{
  bool validateREFIDVar = false;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //text field
  String idnumber;


contrllerClear(){
  _controllerID.clear();
}



  validateID(idnumber){
    if(!(idnumber.length == 13) && idnumber.isNotEmpty){
      return "Reference ID number must be 13-Digits";
    }
    return null;
  }

  @override

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    final idTextField = TextField(
      keyboardType: TextInputType.text,
      autofocus: false,
      maxLength: 13,
      controller: _controllerID,
      onSubmitted: (_) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.black.withOpacity(0.07),
        labelText: 'Enter Reference ID',
        prefixIcon: WidgetAnimator(Icon(Icons.credit_card)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

      ),
    );


    return GestureDetector(
        onTap: () {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    },
    child: Scaffold(
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Container(
          width: width,
          height: height,
          child: Stack(
            children: <Widget>[
              BackBtn(),
              ImageAvatar(
                assetImage: 'assets/patient.png',
              ),
              Container(
                width: width,
                height: height,
                margin:
                      EdgeInsets.fromLTRB(width * 0.01, 0, width*0.03, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
//                    SizedBox(
//                      height: height * 0.05,
//                    ),
                    Text(
                      "\t\tLogin",
                      style: GoogleFonts.abel(
                          fontSize: height * 0.044,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: height*0.05,
                    ),
                    idTextField,
                    SizedBox(
                      height: height * 0.01,
                    ),
                    SizedBox(
                      width: width,
                      height: height * 0.07,
                      child: RaisedButton(
                        color: Colors.blue,
                        shape: StadiumBorder(),
                        onPressed: (){
                          setState(() {
                            Navigator.push(context, new MaterialPageRoute(
                                builder: (BuildContext context) => new PatientHome())
                            );
                          });

                          //Toast.show("Empty Field", context,backgroundColor: Colors.red, backgroundRadius: 5, duration: Toast.LENGTH_LONG);

                        },
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: <Widget>[
//                             WidgetAnimator(
//                               Image(
//                                 image: AssetImage('assets/240_F_63746248_ikHL5mQRmKXeWumLZk7ABJ9PT80VXjW5.jpg'),
//                                   height: height*0.035
//                               ),
//                             ),
                             SizedBox(width: height * 0.015,),
                             Text(
                               ' Login',
                               style: TextStyle(
                                 letterSpacing: 3,
                                 fontWeight: FontWeight.bold,
                                 fontSize: height*0.027,
                                 color: Colors.white,
                               ),
                             )
                           ],
                         ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                   WidgetAnimator(
                    Text(
                     '\t\t\t\t\t\t Enter the Reference ID given by the hospital !',
                       textAlign: TextAlign.center,
                       style: TextStyle(
                       color: Colors.black.withOpacity(0.5),
                       ),
                     ),
                   ),
                    SizedBox(height: height * 0.2,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
    );
  }
}

