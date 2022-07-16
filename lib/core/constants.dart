import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

// Colors
final Color bggradient1 = HexColor("#44235F");
final Color bodyclr = HexColor("#190920");
final Color bggradient2 = HexColor("#D6A5FF");
final Color nowplayingbtm = HexColor('#44235F');
const Color white = Colors.white;
final Color cardshomecolor = HexColor("#151212");

// Textstyle
const TextStyle whitetxt22 = TextStyle(color: white, fontSize: 22);
const TextStyle whitetxt18 = TextStyle(color: white, fontSize: 18);
const TextStyle whitetxt15 = TextStyle(color: white, fontSize: 15);
const TextStyle white30txt12 = TextStyle(color: Colors.white30, fontSize: 12);
const TextStyle white54txt14 = TextStyle(color: Colors.white54, fontSize: 14);

// Box Decoration
final Decoration contborder = BoxDecoration(
  borderRadius: BorderRadius.circular(10),
  color: cardshomecolor,
);

final Decoration mymusicdecor = BoxDecoration(
    borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(40), topRight: Radius.circular(40)),
    color: cardshomecolor);

// Shared Preference key
const String prefKey = 'sharedpref';
