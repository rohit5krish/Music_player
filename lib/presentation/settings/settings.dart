import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player/application/settings/settings_bloc.dart';
import 'package:music_player/core/constants.dart';
import 'package:music_player/presentation/settings/widgets/settings_widget.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);

  late BuildContext ctx;

  //Settings Contents
  final List settinglist = [
    [
      const Icon(
        Icons.notifications,
        color: white,
      ),
      'Notifications'
    ],
    [const Icon(Icons.file_copy, color: white), 'Terms and Conditions'],
    [const Icon(Icons.share, color: white), 'Share'],
    [const Icon(Icons.info_outline, color: white), 'About']
  ];

  @override
  Widget build(BuildContext context) {
    ctx = context;
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
            return BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state) {
                return ListTile(
                  onTap: () {
                    settingontap(index);
                  },
                  leading: settinglist[index][0],
                  trailing: index == 0
                      ? Switch(
                          value: state.isSwitched,
                          onChanged: (value) async {
                            BlocProvider.of<SettingsBloc>(context)
                                .add(ChangeSwitch(switchBool: value));

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
              },
            );
          }),
    );
  }

  settingontap(int idx) async {
    if (idx == 1) {
      Navigator.of(ctx).push(MaterialPageRoute(builder: (context) {
        return termsNcond();
      }));
    } else if (idx == 2) {
      await Share.share(
          'Hey there try out this app. https://play.google.com/store/apps/details?id=com.rohit.music_player');
    } else if (idx == 3) {
      aboutBottom();
    }
  }

  aboutBottom() {
    showModalBottomSheet(
        backgroundColor: bggradient1,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(25))),
        context: ctx,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'About',
                  style: whitetxt22,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Version 1.0.1',
                  style: whitetxt15,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
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
