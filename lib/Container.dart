import 'package:flutter/material.dart';

class Love extends StatelessWidget {
  final String text;
  final MaterialColor colorb;
  Love({this.text, this.colorb});


  @override
  Widget build(BuildContext context) {
    return Container(
    color: colorb ?? Colors.white,
    width: 50,
height: 50,
      child: Text(text ?? "Add Text Please"
      ),


    );
  }
}
