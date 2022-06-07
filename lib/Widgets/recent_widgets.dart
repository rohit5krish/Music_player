// import 'package:flutter/material.dart';
// import 'package:music_player/Colors/screen_colors.dart';

// class recentList extends StatelessWidget {
//   final int index;
//   recentList({required this.index});

//   static const addfav = 'Add To Favourites';
//   static const addplaylist = 'Add To Playlist';

//   final List<String> recentpoplist = [addfav, addplaylist];

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//         leading: ClipRRect(
//           borderRadius: BorderRadius.circular(5),
//           child: Image.asset(
//             songsinfo[index]['img']!,
//             height: 50,
//             width: 50,
//           ),
//         ),
//         title: Text(
//           songsinfo[index]['songname']!,
//           style: whitetxt18,
//         ),
//         subtitle: Text(
//           songsinfo[index]['artist']!,
//           style: white30txt12,
//         ),
//         trailing: PopupMenuButton(
//             onSelected: plylistpopselection,
//             icon: Icon(
//               Icons.more_vert,
//               color: Colors.grey,
//             ),
//             itemBuilder: (context) {
//               return [
//                 ...recentpoplist.map((value) {
//                   return PopupMenuItem(value: value, child: Text(value));
//                 }).toList()
//               ];
//             }));
//   }

//   plylistpopselection(value) {
//     if (value == addfav) {
//       print(value);
//     } else if (value == addplaylist) {
//       print(value);
//     }
//   }
// }
