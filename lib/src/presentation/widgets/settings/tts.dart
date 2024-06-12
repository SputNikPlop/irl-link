import 'dart:io';

import 'package:flutter/material.dart';
import 'package:irllink/src/presentation/controllers/settings_view_controller.dart';
import 'package:get/get.dart';

class Tts extends StatelessWidget {
  final SettingsViewController controller;

  const Tts({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
            onPressed: () => Get.back(),
          ),
          actions: const [],
          title: Text(
            "text_to_speech".tr,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 8),
            color: Theme.of(context).colorScheme.surface,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "enable_tts".tr,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Switch(
                      value: controller.homeViewController.settings.value
                          .ttsSettings!.ttsEnabled,
                      onChanged: (value) {
                        controller.homeViewController.settings.value =
                            controller.homeViewController.settings.value
                                .copyWith(
                          ttsSettings: controller
                              .homeViewController.settings.value.ttsSettings
                              ?.copyWith(ttsEnabled: value),
                        );
                        controller.saveSettings();
                      },
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "language".tr,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    DropdownButton(
                      value: controller.ttsController.ttsLanguages.firstWhere(
                        (element) =>
                            element ==
                            controller.homeViewController.settings.value
                                .ttsSettings!.language,
                      ),
                      onChanged: (value) {
                        controller.homeViewController.settings.value =
                            controller.homeViewController.settings.value
                                .copyWith(
                          ttsSettings: controller
                              .homeViewController.settings.value.ttsSettings
                              ?.copyWith(language: value.toString()),
                        );
                        controller.saveSettings();
                      },
                      items: List.generate(
                        controller.ttsController.ttsLanguages.length,
                        (index) => DropdownMenuItem(
                          value: controller.ttsController.ttsLanguages[index],
                          child: Text(
                            controller.ttsController.ttsLanguages[index],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Platform.isAndroid
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "voice".tr,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          DropdownButton(
                            value:
                                controller.ttsController.ttsVoices.firstWhere(
                              (element) =>
                                  element["name"] ==
                                  controller.homeViewController.settings.value
                                      .ttsSettings!.voice["name"],
                            ),
                            onChanged: (Object? value) {
                              Map<String, String> voice = {
                                "name": (value as Map)["name"],
                                "locale": (value)["locale"],
                              };
                              controller.homeViewController.settings.value =
                                  controller.homeViewController.settings.value
                                      .copyWith(
                                ttsSettings: controller.homeViewController
                                    .settings.value.ttsSettings
                                    ?.copyWith(voice: voice),
                              );
                              controller.saveSettings();
                            },
                            items: List.generate(
                              controller.ttsController.ttsVoices.length,
                              (index) => DropdownMenuItem(
                                value:
                                    controller.ttsController.ttsVoices[index],
                                child: Text(controller
                                    .ttsController.ttsVoices[index]["name"]),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Volume",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Slider(
                      value: controller.homeViewController.settings.value
                          .ttsSettings!.volume,
                      onChanged: (value) {
                        controller.homeViewController.settings.value =
                            controller.homeViewController.settings.value
                                .copyWith(
                          ttsSettings: controller
                              .homeViewController.settings.value.ttsSettings
                              ?.copyWith(volume: value),
                        );
                        controller.saveSettings();
                      },
                      max: 1,
                      min: 0,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "speech_rate".tr,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Slider(
                      value: controller
                          .homeViewController.settings.value.ttsSettings!.rate,
                      onChanged: (value) {
                        controller.homeViewController.settings.value =
                            controller.homeViewController.settings.value
                                .copyWith(
                          ttsSettings: controller
                              .homeViewController.settings.value.ttsSettings
                              ?.copyWith(rate: value),
                        );
                        controller.saveSettings();
                      },
                      max: 1,
                      min: 0,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "pitch".tr,
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Slider(
                      value: controller
                          .homeViewController.settings.value.ttsSettings!.pitch,
                      onChanged: (value) {
                        controller.homeViewController.settings.value =
                            controller.homeViewController.settings.value
                                .copyWith(
                          ttsSettings: controller
                              .homeViewController.settings.value.ttsSettings
                              ?.copyWith(pitch: value),
                        );
                        controller.saveSettings();
                      },
                      max: 1,
                      min: 0,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Mute viewer name",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Switch(
                      value: controller.homeViewController.settings.value
                          .ttsSettings!.ttsMuteViewerName,
                      onChanged: (value) {
                        controller.homeViewController.settings.value =
                            controller.homeViewController.settings.value
                                .copyWith(
                          ttsSettings: controller
                              .homeViewController.settings.value.ttsSettings
                              ?.copyWith(ttsMuteViewerName: value),
                        );
                        controller.saveSettings();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Only read VIP messages",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Switch(
                      value: controller.homeViewController.settings.value
                          .ttsSettings!.ttsOnlyVip,
                      onChanged: (value) {
                        controller.homeViewController.settings.value =
                            controller.homeViewController.settings.value
                                .copyWith(
                          ttsSettings: controller
                              .homeViewController.settings.value.ttsSettings
                              ?.copyWith(ttsOnlyVip: value),
                        );
                        controller.saveSettings();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Only read Moderators messages",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Switch(
                      value: controller.homeViewController.settings.value
                          .ttsSettings!.ttsOnlyMod,
                      onChanged: (value) {
                        controller.homeViewController.settings.value =
                            controller.homeViewController.settings.value
                                .copyWith(
                          ttsSettings: controller
                              .homeViewController.settings.value.ttsSettings
                              ?.copyWith(ttsOnlyMod: value),
                        );
                        controller.saveSettings();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Only read Subscriber messages",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Switch(
                      value: controller.homeViewController.settings.value
                          .ttsSettings!.ttsOnlySubscriber,
                      onChanged: (value) {
                        controller.homeViewController.settings.value =
                            controller.homeViewController.settings.value
                                .copyWith(
                          ttsSettings: controller
                              .homeViewController.settings.value.ttsSettings
                              ?.copyWith(ttsOnlySubscriber: value),
                        );
                        controller.saveSettings();
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    _ttsDialog(
                      title: 'Ignored prefixs',
                      description:
                          'Message starting with these prefixs will not be read aloud.',
                      textFieldHint: 'Prefix',
                      list: controller.homeViewController.settings.value
                          .ttsSettings!.prefixsToIgnore,
                      onDeleted: (index) {
                        controller.homeViewController.settings.value
                            .ttsSettings!.prefixsToIgnore
                            .removeAt(index);
                        controller.homeViewController.settings.value =
                            controller.homeViewController.settings.value
                                .copyWith(
                          ttsSettings: controller
                              .homeViewController.settings.value.ttsSettings
                              ?.copyWith(
                                  prefixsToIgnore: controller
                                      .homeViewController
                                      .settings
                                      .value
                                      .ttsSettings!
                                      .prefixsToIgnore),
                        );
                        controller.saveSettings();
                        controller.nothingJustToRefreshDialog.refresh();
                      },
                      controller: controller,
                      textFieldController:
                          controller.addTtsIgnoredPrefixsController,
                      onAdd: () {
                        controller.homeViewController.settings.value
                            .ttsSettings!.prefixsToIgnore
                            .add(controller.addTtsIgnoredPrefixsController.text
                                .trim());
                        controller.homeViewController.settings.value =
                            controller.homeViewController.settings.value
                                .copyWith(
                          ttsSettings: controller
                              .homeViewController.settings.value.ttsSettings
                              ?.copyWith(
                                  prefixsToIgnore: controller
                                      .homeViewController
                                      .settings
                                      .value
                                      .ttsSettings!
                                      .prefixsToIgnore),
                        );
                        controller.addTtsIgnoredPrefixsController.clear();
                        controller.saveSettings();
                        controller.nothingJustToRefreshDialog.refresh();
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "prefixs_ignored".tr,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "prefixs_ignored_details".tr,
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryIconTheme.color,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    _ttsDialog(
                      title: 'Allowed prefixs',
                      description:
                          'Only messages starting with these prefixs will be read aloud.',
                      textFieldHint: 'Prefix',
                      list: controller.homeViewController.settings.value
                          .ttsSettings!.prefixsToUseTtsOnly,
                      onDeleted: (index) {
                        controller.homeViewController.settings.value
                            .ttsSettings!.prefixsToUseTtsOnly
                            .removeAt(index);
                        controller.homeViewController.settings.value =
                            controller.homeViewController.settings.value
                                .copyWith(
                          ttsSettings: controller
                              .homeViewController.settings.value.ttsSettings
                              ?.copyWith(
                                  prefixsToUseTtsOnly: controller
                                      .homeViewController
                                      .settings
                                      .value
                                      .ttsSettings!
                                      .prefixsToUseTtsOnly),
                        );
                        controller.nothingJustToRefreshDialog.refresh();
                        controller.saveSettings();
                      },
                      controller: controller,
                      textFieldController:
                          controller.addTtsAllowedPrefixsController,
                      onAdd: () {
                        controller.homeViewController.settings.value
                            .ttsSettings!.prefixsToUseTtsOnly
                            .add(controller.addTtsAllowedPrefixsController.text
                                .trim());
                        controller.homeViewController.settings.value =
                            controller.homeViewController.settings.value
                                .copyWith(
                          ttsSettings: controller
                              .homeViewController.settings.value.ttsSettings
                              ?.copyWith(
                                  prefixsToUseTtsOnly: controller
                                      .homeViewController
                                      .settings
                                      .value
                                      .ttsSettings!
                                      .prefixsToUseTtsOnly),
                        );
                        controller.nothingJustToRefreshDialog.refresh();
                        controller.addTtsAllowedPrefixsController.clear();
                        controller.saveSettings();
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "prefixs_allowed".tr,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Text(
                              "prefixs_allowed_details".tr,
                              style: TextStyle(
                                color: Colors.grey[400],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryIconTheme.color,
                        size: 18,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    _ttsDialog(
                      title: 'Ignored users',
                      description: 'Users that will not be read aloud.',
                      textFieldHint: 'Username',
                      list: controller.homeViewController.settings.value
                          .ttsSettings!.ttsUsersToIgnore,
                      onDeleted: (index) {
                        controller.homeViewController.settings.value
                            .ttsSettings!.ttsUsersToIgnore
                            .removeAt(index);
                        controller.homeViewController.settings.value =
                            controller.homeViewController.settings.value
                                .copyWith(
                          ttsSettings: controller
                              .homeViewController.settings.value.ttsSettings
                              ?.copyWith(
                                  ttsUsersToIgnore: controller
                                      .homeViewController
                                      .settings
                                      .value
                                      .ttsSettings!
                                      .ttsUsersToIgnore),
                        );
                        controller.saveSettings();
                        controller.nothingJustToRefreshDialog.refresh();
                      },
                      controller: controller,
                      textFieldController:
                          controller.addTtsIgnoredUsersController,
                      onAdd: () {
                        controller.homeViewController.settings.value
                            .ttsSettings!.ttsUsersToIgnore
                            .add(controller.addTtsIgnoredUsersController.text
                                .trim());
                        controller.homeViewController.settings.value =
                            controller.homeViewController.settings.value
                                .copyWith(
                          ttsSettings: controller
                              .homeViewController.settings.value.ttsSettings
                              ?.copyWith(
                                  ttsUsersToIgnore: controller
                                      .homeViewController
                                      .settings
                                      .value
                                      .ttsSettings!
                                      .ttsUsersToIgnore),
                        );
                        controller.addTtsIgnoredUsersController.clear();
                        controller.saveSettings();
                        controller.nothingJustToRefreshDialog.refresh();
                      },
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "ignored_users".tr,
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "ignored_users_details".tr,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Theme.of(context).primaryIconTheme.color,
                        size: 18,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _ttsDialog({
    required String title,
    required String description,
    required String textFieldHint,
    required List list,
    required Function onDeleted,
    required TextEditingController textFieldController,
    required Function onAdd,
    required SettingsViewController controller,
  }) {
    Get.defaultDialog(
      title: title,
      titleStyle: Theme.of(Get.context!).textTheme.bodyLarge!,
      buttonColor: const Color(0xFF9147ff),
      cancelTextColor: const Color(0xFF9147ff),
      textCancel: "Back",
      radius: 10,
      content: Obx(
        () => Column(
          children: [
            Text(
              description,
              style:
                  TextStyle(color: controller.nothingJustToRefreshDialog.value),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Visibility(
              visible: list.isNotEmpty,
              child: SizedBox(
                width: double.maxFinite,
                height: 50,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Chip(
                        onDeleted: () {
                          onDeleted(index);
                        },
                        label: Text(list[index]),
                      ),
                    );
                  },
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 7,
                  child: TextField(
                    controller: textFieldController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16),
                      hintText: textFieldHint,
                      labelText: textFieldHint,
                      labelStyle: TextStyle(
                        color: Theme.of(Get.context!).colorScheme.tertiary,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor:
                            Theme.of(Get.context!).colorScheme.tertiary,
                      ),
                      onPressed: () {
                        onAdd();
                      },
                      child: Text(
                        "add".tr,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
