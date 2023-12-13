import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:playtfrom_converter_app/views/components/AddChat/Provider/add_chat_provider.dart';
import 'package:playtfrom_converter_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Provider.of<AppProvider>(context).appModel.isIos == false)
        ? (Provider.of<AddChatProvider>(context)
                .addChatModel
                .fullName
                .isNotEmpty)
            ? ListView.builder(
                itemCount: Provider.of<AddChatProvider>(context)
                    .addChatModel
                    .fullName
                    .length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  horizontalTitleGap: 10,
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) => Container(
                        height: 350,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 70,
                              foregroundImage: FileImage(
                                File(
                                  Provider.of<AddChatProvider>(context)
                                      .addChatModel
                                      .image[index],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              Provider.of<AddChatProvider>(context)
                                  .addChatModel
                                  .fullName[index],
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              Provider.of<AddChatProvider>(context)
                                  .addChatModel
                                  .chatConversation[index],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.edit),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            OutlinedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text("Cancel"),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
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
                  trailing: Text(
                    "${Provider.of<AddChatProvider>(context, listen: false).addChatModel.date[index]}, ${Provider.of<AddChatProvider>(context, listen: false).addChatModel.time[index]}",
                  ),
                ),
              )
            : const Center(
                child: Text("No any chat yet..."),
              )
        : (Provider.of<AddChatProvider>(context)
                .addChatModel
                .fullName
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
                    onTap: () {
                      showCupertinoModalPopup(
                        context: context,
                        builder: (context) => Container(
                          height: 350,
                          width: MediaQuery.of(context).size.width,
                          color: CupertinoColors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 70,
                                foregroundImage: FileImage(
                                  File(
                                    Provider.of<AddChatProvider>(context)
                                        .addChatModel
                                        .image[index],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                Provider.of<AddChatProvider>(context)
                                    .addChatModel
                                    .fullName[index],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                Provider.of<AddChatProvider>(context)
                                    .addChatModel
                                    .chatConversation[index],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CupertinoButton(
                                    onPressed: () {},
                                    child: const Icon(CupertinoIcons.pen),
                                  ),
                                  CupertinoButton(
                                    onPressed: () {},
                                    child:
                                        const Icon(CupertinoIcons.delete_solid),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              CupertinoButton.filled(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("Cancel"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
                    trailing: Text(
                      "${Provider.of<AddChatProvider>(context, listen: false).addChatModel.date[index]}, ${Provider.of<AddChatProvider>(context, listen: false).addChatModel.time[index]}",
                    ),
                  ),
                ),
              )
            : const Center(
                heightFactor: 35,
                child: Text("No any chat yet..."),
              );
  }
}
