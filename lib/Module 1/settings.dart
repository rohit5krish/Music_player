import 'package:flutter/material.dart';
import 'package:music_player/Colors/screen_colors.dart';
import 'package:music_player/Widgets/settings_widget.dart';
import 'package:music_player/splash.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

ValueNotifier<bool> isSwitched = ValueNotifier(prefbool);
const String prefKey = 'sharedpref';

class _SettingsState extends State<Settings> {
  //Settings Contents
  final List settinglist = [
    [
      Icon(
        Icons.notifications,
        color: white,
      ),
      'Notifications'
    ],
    [Icon(Icons.file_copy, color: white), 'Terms and Conditions'],
    [Icon(Icons.share, color: white), 'Share'],
    [Icon(Icons.info_outline, color: white), 'About']
  ];

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
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text('Settings'),
      ),
      backgroundColor: bodyclr,
      body: ListView.builder(
          itemCount: settinglist.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                settingontap(index);
              },
              leading: settinglist[index][0],
              trailing: index == 0
                  ? Switch(
                      value: isSwitched.value,
                      onChanged: (value) async {
                        setState(() {
                          isSwitched.value = value;
                        });
                        final pref = await SharedPreferences.getInstance();
                        pref.setBool(prefKey, value);
                      },
                      inactiveTrackColor: Colors.grey,
                    )
                  : null,
              title: Text(
                settinglist[index][1],
                style: whitetxt18,
              ),
            );
          }),
    );
  }

  settingontap(int idx) async {
    if (idx == 1) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return termsNcond();
      }));
    } else if (idx == 2) {
      await Share.share(
          'Hey there this is good app to listen to listen to Music');
    } else if (idx == 3) {
      aboutBottom();
    }
  }

  aboutBottom() {
    showModalBottomSheet(
        backgroundColor: bggradient1,
        shape: const RoundedRectangleBorder(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(25))),
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'About',
                  style: whitetxt22,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'Version 1.0.0',
                  style: whitetxt15,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Email : rohitkrishnark5@gmail.com',
                  style: whitetxt15,
                ),
                const SizedBox(
                  height: 17,
                ),
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Ok'))
              ],
            ),
          );
        });
  }
}
