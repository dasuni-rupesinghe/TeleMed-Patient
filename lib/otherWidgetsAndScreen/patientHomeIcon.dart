import 'package:flutter/material.dart';

class IconContent extends StatelessWidget{
  IconContent({
   @required this.icon, this.text
});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
     // mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 60.0,
        ),
        SizedBox(
          height: 9.0,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 18.0, color: Colors.red,
          ),
        )
      ],
    );
  }

}