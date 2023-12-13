import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playtfrom_converter_app/views/components/AddChat/Provider/add_chat_provider.dart';
import 'package:playtfrom_converter_app/providers/app_provider.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class CallsPage extends StatelessWidget {
  CallsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Provider.of<AppProvider>(context).appModel.isIos == false)
        ? (Provider.of<AddChatProvider>(context)
                .addChatModel
                .phoneNumber
                .isNotEmpty)
            ? ListView.builder(
                itemCount: Provider.of<AddChatProvider>(context)
                    .addChatModel
                    .fullName
                    .length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  horizontalTitleGap: 10,
                  leading: CircleAvatar(
                    radius: 30,
                    foregroundImage: FileImage(
                      File(
                        Provider.of<AddChatProvider>(context)
                            .addChatModel
                            .image[index],
                      ),
                    ),
                  ),
                  title: Text(
                    Provider.of<AddChatProvider>(context)
                        .addChatModel
                        .fullName[index],
                  ),
                  subtitle: Text(
                    Provider.of<AddChatProvider>(context)
                        .addChatModel
                        .chatConversation[index],
                  ),
                  trailing: IconButton(
                    onPressed: () async {
                      Uri uri = Uri.parse(
                          "tel:+91${Provider.of<AddChatProvider>(context, listen: false).addChatModel.phoneNumber[index]}");

                      try {
                        await launchUrl(uri);
                      } catch (e) {
                        print("Exception : $e");
                      }
                    },
                    icon: const Icon(
                      Icons.phone,
                      color: Colors.green,
                    ),
                  ),
                ),
              )
            : const Center(
                child: Text("No any calls yet..."),
              )
        : (Provider.of<AddChatProvider>(context)
                .addChatModel
                .phoneNumber
                .isNotEmpty)
            ? CupertinoListSection(
                children: List.generate(
                  Provider.of<AddChatProvider>(context)
                      .addChatModel
                      .fullName
                      .length,
                  (index) => CupertinoListTile(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    leadingSize: 80,
                    leadingToTitle: 5,
                    leading: CircleAvatar(
                      radius: 30,
                      foregroundImage: FileImage(
                        File(
                          Provider.of<AddChatProvider>(context)
                              .addChatModel
                              .image[index],
                        ),
                      ),
                    ),
                    title: Text(
                      Provider.of<AddChatProvider>(context)
                          .addChatModel
                          .fullName[index],
                    ),
                    subtitle: Text(
                      Provider.of<AddChatProvider>(context)
                          .addChatModel
                          .chatConversation[index],
                    ),
                    trailing: CupertinoButton(
                      onPressed: () async {
                        Uri uri = Uri.parse(
                            "tel:+91${Provider.of<AddChatProvider>(context, listen: false).addChatModel.phoneNumber[index]}");

                        try {
                          await launchUrl(uri);
                        } catch (e) {
                          print("Exception : $e");
                        }
                      },
                      child: const Icon(
                        CupertinoIcons.phone,
                        color: CupertinoColors.activeBlue,
                      ),
                    ),
                  ),
                ),
              )
            : const Center(
                heightFactor: 35,
                child: Text("No any calls yet..."),
              );
  }
}
