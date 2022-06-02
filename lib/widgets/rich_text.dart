import 'package:flutter/material.dart';


RichText buildRichText() {
  return RichText(
    text: const TextSpan(children: [
      TextSpan(
        text: "ali",
        style:  TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent),
      ),
      TextSpan(
        text: " hassan",
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent),
      )
    ]),
  );
}
