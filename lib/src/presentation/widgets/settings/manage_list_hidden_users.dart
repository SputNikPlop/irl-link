import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/settings_view_controller.dart';

class ManageListHiddenUsers extends GetView {
  const ManageListHiddenUsers({
    super.key,
    required this.controller,
  });

  @override
  final SettingsViewController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
            onPressed: () => Get.back(),
          ),
          actions: const [],
          title: const Text(
            "Manage hidden users",
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: controller.homeViewController.settings.value
                        .hiddenUsersIds!.isEmpty
                    ? Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: const Text(
                          "Nothing in the list! To add users, select them in a chat and press 'Hide user'",
                          textAlign: TextAlign.center,
                        ),
                      )
                    : controller.usernamesHiddenUsers.length !=
                            controller.homeViewController.settings.value
                                .hiddenUsersIds!.length
                        ? Container(
                            padding: const EdgeInsets.only(top: 20),
                            child: const Column(
                              children: [
                                CircularProgressIndicator(),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Loading...",
                                ),
                              ],
                            ),
                          )
                        : ReorderableListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(
                                top: 8, left: 18, right: 18, bottom: 8),
                            itemCount: controller.usernamesHiddenUsers.length,
                            onReorder: (int oldIndex, int newIndex) {
                              if (newIndex > oldIndex) {
                                newIndex -= 1;
                              }
                              final element = controller.homeViewController
                                  .settings.value.hiddenUsersIds!
                                  .removeAt(oldIndex);
                              controller.homeViewController.settings.value
                                  .hiddenUsersIds!
                                  .insert(newIndex, element);
                            },
                            itemBuilder: (BuildContext context, int index) {
                              var elem = controller.homeViewController.settings
                                  .value.hiddenUsersIds![index];

                              return Container(
                                key: ValueKey(
                                  elem,
                                ),
                                color: Theme.of(context).colorScheme.secondary,
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, bottom: 10, top: 10),
                                margin:
                                    const EdgeInsets.only(bottom: 5, top: 5),
                                child: InkWell(
                                  onTap: () {},
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        controller.usernamesHiddenUsers[index],
                                        style: TextStyle(
                                          color: Theme.of(context)
                                              .textTheme
                                              .bodyLarge!
                                              .color,
                                          fontSize: 20,
                                        ),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          controller.usernamesHiddenUsers
                                              .removeAt(index);
                                          controller.removeHiddenUser(elem);
                                        },
                                        child: const Icon(
                                          Icons.close,
                                          color: Colors.red,
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
              ),
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
