import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:playtfrom_converter_app/providers/app_provider.dart';
import 'package:playtfrom_converter_app/views/components/SettingPage/Provider/profile_provider.dart';
import 'package:playtfrom_converter_app/views/components/SettingPage/Provider/theme_provider.dart';

import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Provider.of<AppProvider>(context).appModel.isIos == false)
        ? Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SwitchListTile(
                    secondary: const Icon(Icons.person),
                    title: const Text("Profile"),
                    subtitle: const Text("Update Profile Data"),
                    value: Provider.of<ProfileProvider>(context)
                        .profileModel
                        .profileSwitch,
                    onChanged: (val) {
                      Provider.of<ProfileProvider>(context, listen: false)
                          .changeProfileSwitchValue();
                    },
                  ),
                  (Provider.of<ProfileProvider>(context, listen: false)
                          .profileModel
                          .profileSwitch)
                      ? Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Provider.of<ProfileProvider>(context,
                                          listen: false)
                                      .pickImage();
                                },
                                child: CircleAvatar(
                                  radius: 60,
                                  foregroundImage: FileImage(
                                      Provider.of<ProfileProvider>(context)
                                          .profileModel
                                          .userImage),
                                  child: const Icon(
                                    Icons.add_a_photo_outlined,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller:
                                    Provider.of<ProfileProvider>(context)
                                        .profileModel
                                        .userName,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter your name...",
                                ),
                              ),
                              TextFormField(
                                controller:
                                    Provider.of<ProfileProvider>(context)
                                        .profileModel
                                        .userBio,
                                textAlign: TextAlign.center,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Enter your bio...",
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Provider.of<ProfileProvider>(context,
                                              listen: false)
                                          .saveDetails();
                                    },
                                    child: const Text("SAVE"),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Provider.of<ProfileProvider>(context,
                                              listen: false)
                                          .clearDetails();
                                    },
                                    child: const Text("CLEAR"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  const Divider(),
                  SwitchListTile(
                    secondary:
                        (Provider.of<ThemeProvider>(context, listen: false)
                                .themeModel
                                .isDark)
                            ? const Icon(Icons.light_mode_outlined)
                            : const Icon(Icons.dark_mode_outlined),
                    title: const Text("Theme"),
                    subtitle: const Text("Change Theme"),
                    value:
                        Provider.of<ThemeProvider>(context).themeModel.isDark,
                    onChanged: (val) {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .changeTheme();
                    },
                  ),
                ],
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  CupertinoListTile(
                    leading: const Icon(CupertinoIcons.person),
                    title: const Text("Profile"),
                    subtitle: const Text("Update Profile Data"),
                    trailing: CupertinoSwitch(
                      value: Provider.of<ProfileProvider>(context)
                          .profileModel
                          .profileSwitch,
                      onChanged: (val) {
                        Provider.of<ProfileProvider>(context, listen: false)
                            .changeProfileSwitchValue();
                      },
                    ),
                  ),
                  (Provider.of<ProfileProvider>(context, listen: false)
                          .profileModel
                          .profileSwitch)
                      ? Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Provider.of<ProfileProvider>(context,
                                          listen: false)
                                      .pickImage();
                                },
                                child: CircleAvatar(
                                  radius: 60,
                                  foregroundImage: FileImage(
                                      Provider.of<ProfileProvider>(context)
                                          .profileModel
                                          .userImage),
                                  child: const Icon(
                                    CupertinoIcons.camera,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              CupertinoTextFormFieldRow(
                                controller:
                                    Provider.of<ProfileProvider>(context)
                                        .profileModel
                                        .userName,
                                textAlign: TextAlign.center,
                                placeholder: "Enter your name...",
                              ),
                              CupertinoTextFormFieldRow(
                                controller:
                                    Provider.of<ProfileProvider>(context)
                                        .profileModel
                                        .userBio,
                                textAlign: TextAlign.center,
                                placeholder: "Enter your bio...",
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CupertinoButton(
                                    onPressed: () {
                                      Provider.of<ProfileProvider>(context,
                                              listen: false)
                                          .saveDetails();
                                    },
                                    child: const Text("SAVE"),
                                  ),
                                  CupertinoButton(
                                    onPressed: () {
                                      Provider.of<ProfileProvider>(context,
                                              listen: false)
                                          .clearDetails();
                                    },
                                    child: const Text("CLEAR"),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                  const Divider(),
                  CupertinoListTile(
                    leading: (Provider.of<ThemeProvider>(context, listen: false)
                            .themeModel
                            .isDark)
                        ? const Icon(CupertinoIcons.sun_max)
                        : const Icon(CupertinoIcons.moon),
                    title: const Text("Theme"),
                    subtitle: const Text("Change Theme"),
                    trailing: CupertinoSwitch(
                      value:
                          Provider.of<ThemeProvider>(context).themeModel.isDark,
                      onChanged: (val) {
                        Provider.of<ThemeProvider>(context, listen: false)
                            .changeTheme();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
