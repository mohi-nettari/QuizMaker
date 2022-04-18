import 'package:flutter/material.dart';

Widget appBar(BuildContext context) {
  return RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      style: TextStyle(fontSize: 22),
      children: const <TextSpan>[
        TextSpan(
            text: 'Quiz',
            style:
                TextStyle(fontWeight: FontWeight.w600, color: Colors.black54)),
        TextSpan(
            text: 'Maker',
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.blue)),
      ],
    ),
  );
}

Widget blueButton({required BuildContext context,required String name,buttonWidth}) {
  return Container(
    alignment: Alignment.center,
    width:buttonWidth != null ? buttonWidth : MediaQuery.of(context).size.width - 48,
    margin: EdgeInsets.fromLTRB(35, 0, 35, 0),
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    decoration: BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.circular(30)),
    child: Text(
      name,
      style: TextStyle(fontSize: 16, color: Colors.white),
    ),
  );
}
