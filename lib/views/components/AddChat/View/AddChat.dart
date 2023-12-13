import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playtfrom_converter_app/views/components/AddChat/Global/variables.dart';
import 'package:playtfrom_converter_app/views/components/AddChat/Provider/add_chat_provider.dart';
import 'package:playtfrom_converter_app/providers/app_provider.dart';
import 'package:provider/provider.dart';

class AddChat extends StatelessWidget {
   AddChat({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return (Provider.of<AppProvider>(context).appModel.isIos == false)
        ? Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<AddChatProvider>(context, listen: false)
                            .pickImage();
                      },
                      child: CircleAvatar(
                        radius: 60,
                        foregroundImage: (Provider.of<AddChatProvider>(context)
                                    .addChatModel
                                    .img !=
                                null)
                            ? FileImage(Provider.of<AddChatProvider>(context)
                                .addChatModel
                                .img!)
                            : FileImage(File('')),
                        child: const Icon(
                          Icons.add_a_photo_outlined,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: Variables.name,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Full Name";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.person_outline),
                        labelText: "Full Name",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: Variables.phone,
                      keyboardType: TextInputType.number,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Phone Number";
                        } else if (val.length != 10) {
                          return "Not Valid Number";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        labelText: "Phone Number",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller: Variables.chat,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return "Enter Any Message";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.message_outlined),
                        labelText: "Chat Conversation",
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Provider.of<AddChatProvider>(context, listen: false)
                            .addChatModel
                            .tempDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                        );

                        Provider.of<AddChatProvider>(context, listen: false)
                            .pickDate();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.calendar_month),
                          const SizedBox(
                            width: 10,
                          ),
                          (Provider.of<AddChatProvider>(context, listen: false)
                                      .addChatModel
                                      .pickDate !=
                                  null)
                              ? Text(
                                  "${Provider.of<AddChatProvider>(context).addChatModel.pickDate?.day} / ${Provider.of<AddChatProvider>(context).addChatModel.pickDate?.month} / ${Provider.of<AddChatProvider>(context).addChatModel.pickDate?.year}",
                                )
                              : const Text("Pick Date"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        Provider.of<AddChatProvider>(context, listen: false)
                            .addChatModel
                            .tempTime = await showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        );

                        Provider.of<AddChatProvider>(context, listen: false)
                            .pickTime();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(Icons.access_time_outlined),
                          const SizedBox(
                            width: 10,
                          ),
                          (Provider.of<AddChatProvider>(context, listen: false)
                                      .addChatModel
                                      .pickTime !=
                                  null)
                              ? Text(
                                  "${Provider.of<AddChatProvider>(context).addChatModel.pickTime?.hour} : ${Provider.of<AddChatProvider>(context).addChatModel.pickTime?.minute}",
                                )
                              : const Text("Pick Time"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    OutlinedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate() &&
                            Provider.of<AddChatProvider>(context, listen: false)
                                    .addChatModel
                                    .img !=
                                null &&
                            Provider.of<AddChatProvider>(context, listen: false)
                                    .addChatModel
                                    .pickDate !=
                                null &&
                            Provider.of<AddChatProvider>(context, listen: false)
                                    .addChatModel
                                    .pickTime !=
                                null) {
                          Provider.of<AddChatProvider>(context, listen: false)
                              .saveChat();
                        }
                      },
                      child: const Text("Save"),
                    ),
                  ],
                ),
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<AddChatProvider>(context, listen: false)
                            .pickImage();
                      },
                      child: CircleAvatar(
                        radius: 60,
                        foregroundImage: (Provider.of<AddChatProvider>(context)
                                    .addChatModel
                                    .img !=
                                null)
                            ? FileImage(Provider.of<AddChatProvider>(context)
                                .addChatModel
                                .img!)
                            : FileImage(File('')),
                        child: const Icon(
                          CupertinoIcons.photo_camera,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Transform.scale(
                      scale: 1.08,
                      child: CupertinoTextFormFieldRow(
                        controller: Variables.name,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Full Name";
                          } else {
                            return null;
                          }
                        },
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        placeholder: "Full Name",
                        prefix: const Icon(
                          CupertinoIcons.person,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Transform.scale(
                      scale: 1.08,
                      child: CupertinoTextFormFieldRow(
                        controller: Variables.phone,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Phone Number";
                          } else if (val.length != 10) {
                            return "Not Valid Number";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        placeholder: "Phone Number",
                        prefix: const Icon(
                          CupertinoIcons.phone,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Transform.scale(
                      scale: 1.08,
                      child: CupertinoTextFormFieldRow(
                        controller: Variables.chat,
                        validator: (val) {
                          if (val!.isEmpty) {
                            return "Enter Any Message";
                          } else {
                            return null;
                          }
                        },
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        placeholder: "Chat Conversation",
                        prefix: const Icon(
                          CupertinoIcons.chat_bubble_text,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => Container(
                            height: 350,
                            color: CupertinoColors.white,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.date,
                              initialDateTime: DateTime.now(),
                              minimumYear: 2000,
                              maximumYear: 2100,
                              onDateTimeChanged: (val) {
                                Provider.of<AddChatProvider>(context,
                                        listen: false)
                                    .addChatModel
                                    .pickDate = val;

                                Provider.of<AddChatProvider>(context,
                                        listen: false)
                                    .pickDate();
                              },
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(CupertinoIcons.calendar),
                          const SizedBox(
                            width: 10,
                          ),
                          (Provider.of<AddChatProvider>(context, listen: false)
                                      .addChatModel
                                      .pickDate !=
                                  null)
                              ? Text(
                                  "${Provider.of<AddChatProvider>(context).addChatModel.pickDate?.day} / ${Provider.of<AddChatProvider>(context).addChatModel.pickDate?.month} / ${Provider.of<AddChatProvider>(context).addChatModel.pickDate?.year}",
                                )
                              : const Text("Pick Date"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => Container(
                            height: 350,
                            color: Colors.white,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.time,
                              initialDateTime: DateTime.now(),
                              minimumYear: 2000,
                              maximumYear: 2100,
                              onDateTimeChanged: (val) {
                                Provider.of<AddChatProvider>(context,
                                        listen: false)
                                    .addChatModel
                                    .pickTime = TimeOfDay.fromDateTime(val);

                                Provider.of<AddChatProvider>(context,
                                        listen: false)
                                    .pickTime();
                              },
                            ),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(CupertinoIcons.time),
                          const SizedBox(
                            width: 10,
                          ),
                          (Provider.of<AddChatProvider>(context, listen: false)
                                      .addChatModel
                                      .pickTime !=
                                  null)
                              ? Text(
                                  "${Provider.of<AddChatProvider>(context).addChatModel.pickTime?.hour} : ${Provider.of<AddChatProvider>(context).addChatModel.pickTime?.minute}",
                                )
                              : const Text("Pick Time"),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CupertinoButton(
                      onPressed: () {
                        if (formKey.currentState!.validate() &&
                            Provider.of<AddChatProvider>(context, listen: false)
                                    .addChatModel
                                    .img !=
                                null &&
                            Provider.of<AddChatProvider>(context, listen: false)
                                    .addChatModel
                                    .pickDate !=
                                null &&
                            Provider.of<AddChatProvider>(context, listen: false)
                                    .addChatModel
                                    .pickTime !=
                                null) {
                          Provider.of<AddChatProvider>(context, listen: false)
                              .saveChat();
                        }
                      },
                      child: const Text("Save"),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}
