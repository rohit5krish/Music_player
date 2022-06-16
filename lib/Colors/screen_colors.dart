// ignore_for_file: prefer_const_constructors, prefer_const_declarations

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

final Color bggradient1 = HexColor("#44235F");
final Color bodyclr = HexColor("#190920");
final Color bggradient2 = HexColor("#D6A5FF");
final Color nowplayingbtm = HexColor('#44235F');
final Color white = Colors.white;
final Color cardshomecolor = HexColor("#151212");

final TextStyle whitetxt22 = TextStyle(color: white, fontSize: 22);
final TextStyle whitetxt18 = TextStyle(color: white, fontSize: 18);
final TextStyle whitetxt15 = TextStyle(color: white, fontSize: 15);
final TextStyle white30txt12 = TextStyle(color: Colors.white30, fontSize: 12);
final TextStyle white54txt14 = TextStyle(color: Colors.white54, fontSize: 14);

final Decoration contborder = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: cardshomecolor,
);

final Decoration mymusicdecor = BoxDecoration(
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40), topRight: Radius.circular(40)),
    color: cardshomecolor);
