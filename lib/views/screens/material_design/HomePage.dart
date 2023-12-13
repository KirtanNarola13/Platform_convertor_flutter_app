import 'package:flutter/material.dart';
import 'package:playtfrom_converter_app/providers/app_provider.dart';
import 'package:playtfrom_converter_app/views/components/AddChat/View/AddChat.dart';
import 'package:playtfrom_converter_app/views/components/CallPage/Views/CallsPage.dart';
import 'package:playtfrom_converter_app/views/components/ChatPage/Views/ChatPage.dart';
import 'package:playtfrom_converter_app/views/components/SettingPage/Views/SettingsPage.dart';

import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Platform Converter"),
          actions: [
            Switch(
              value: Provider.of<AppProvider>(context).appModel.isIos,
              onChanged: (val) {
                Provider.of<AppProvider>(context, listen: false).switchUi();
              },
            ),
          ],
          bottom: const TabBar(
            physics: BouncingScrollPhysics(),
            labelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            tabs: [
              Icon(Icons.person_add_alt),
              Text("CHATS"),
              Text("CALLS"),
              Text("SETTINGS"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            AddChat(),
            ChatPage(),
            CallsPage(),
            SettingsPage(),
          ],
        ),
      ),
    );
  }
}
