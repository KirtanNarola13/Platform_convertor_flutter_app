import 'package:flutter/cupertino.dart';
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
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_add),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            label: "CHATS",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.phone),
            label: "CALLS",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.settings),
            label: "SETTINGS",
          ),
        ],
      ),
      tabBuilder: (context, i) {
        return CupertinoTabView(
          builder: (context) {
            return CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                middle: const Text("Platform Converter"),
                trailing: CupertinoSwitch(
                  value: Provider.of<AppProvider>(context).appModel.isIos,
                  onChanged: (val) {
                    Provider.of<AppProvider>(context, listen: false).switchUi();
                  },
                ),
              ),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    IndexedStack(
                      index: i,
                      children: [
                        AddChat(),
                        const ChatPage(),
                        CallsPage(),
                        const SettingsPage(),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}
