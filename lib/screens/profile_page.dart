import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:profile/profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea( //TODO: Add profile settings
      child: SettingsList(
        sections: [
          SettingsSection(
            title: Text('General',style: Theme.of(context).textTheme.bodyLarge),
            tiles: [
              SettingsTile.navigation(
                title: Text('Abstract settings screen'),
                leading: Icon(Icons.handyman),
                description: Text('UI created to show plugin\'s possibilities'),
                onPressed: (context) {
                },
              )
            ],
          ),
          SettingsSection(
            title: Text('Replications',style: Theme.of(context).textTheme.bodyLarge),
            tiles: [
              SettingsTile.navigation(
                leading: Icon(IconlyLight.setting),
                title: Text('Android Developer Screen'),
                onPressed: (context) {
                },
              ),
              SettingsTile.navigation(
                leading: Icon(CupertinoIcons.settings),
                title: Text('iOS Settings Screen'),
                onPressed: (context) {
                },
              ),
              SettingsTile.navigation(
                leading: Icon(Icons.web),
                title: Text('Web Settings'),
                onPressed: (context) {
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
  }
