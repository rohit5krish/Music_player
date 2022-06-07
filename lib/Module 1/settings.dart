import 'package:flutter/material.dart';
import 'package:music_player/Colors/screen_colors.dart';

class Settings extends StatefulWidget {
  Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  //Settings Contents
  final List<String> settinglist = [
    'Notifications',
    'Terms and Conditions',
    'Privacy Policy',
    'About'
  ];

  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 65,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
        title: Text('Settings'),
      ),
      backgroundColor: bodyclr,
      body: Column(
        children: [
          //Settings List
          Expanded(
            flex: 8,
            child: ListView.builder(
                itemCount: settinglist.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    trailing: index == 0
                        ? Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                            inactiveTrackColor: Colors.grey,
                          )
                        : null,
                    title: Text(
                      settinglist[index],
                      style: whitetxt18,
                    ),
                  );
                }),
          ),
          //Version
          Expanded(
            flex: 1,
            child: Text(
              'Version 1.0.0',
              style: TextStyle(color: Colors.grey[600], fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}
