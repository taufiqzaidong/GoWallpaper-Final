import 'package:flutter/material.dart';

Widget titleAppBar() {
  return RichText(
    text: TextSpan(children: <TextSpan>[
      TextSpan(
          text: "Go",
          style: TextStyle(
              color: Colors.purple[400],
              fontWeight: FontWeight.bold,
              fontSize: 25,
              fontFamily: 'Bebas')),
      TextSpan(
          text: "Wallpaper",
          style:
              TextStyle(color: Colors.grey, fontSize: 25, fontFamily: 'Bebas')),
    ]),
  );
}
