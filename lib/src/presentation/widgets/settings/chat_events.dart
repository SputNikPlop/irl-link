import 'package:flutter/material.dart';
import 'package:irllink/src/presentation/controllers/settings_view_controller.dart';
import 'package:get/get.dart';
import 'package:irllink/src/presentation/widgets/chats/chat_message/shared/event_container.dart';
import 'package:twitch_chat/twitch_chat.dart';

import 'package:irllink/src/domain/entities/chat/chat_message.dart' as entity;

class ChatEvents extends StatelessWidget {
  final SettingsViewController controller;

  const ChatEvents({super.key, required this.controller});

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
          title: const Text(
            "Chat events",
            style: TextStyle(),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding:
                const EdgeInsets.only(top: 8, left: 10, right: 10, bottom: 8),
            color: Theme.of(context).colorScheme.surface,
            child: Column(
              children: [
                Column(
                  children: [
                    EventContainer(
                      message: entity.ChatMessage.fromTwitch(
                        ChatMessage.randomGeneration(
                          HighlightType.firstTimeChatter,
                          "Hey guys, I'm new here!",
                          "Lezd",
                        ),
                        '',
                      ),
                      selectedMessage: null,
                      displayTimestamp: false,
                      textSize: 16,
                      hideDeletedMessages: false,
                      cheerEmotes: const [],
                      thirdPartEmotes: const [],
                      showPlatformBadge: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "First time chatter",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: controller.homeViewController.settings.value
                              .chatEventsSettings!.firstsMessages,
                          onChanged: (value) {
                            controller.homeViewController.settings.value =
                                controller.homeViewController.settings.value
                                    .copyWith(
                              chatEventsSettings: controller.homeViewController
                                  .settings.value.chatEventsSettings!
                                  .copyWith(
                                firstsMessages: value,
                              ),
                            );
                            controller.saveSettings();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                ),
                Column(
                  children: [
                    EventContainer(
                      message: entity.ChatMessage.fromTwitch(
                        Subscription.randomGeneration(),
                        '',
                      ),
                      selectedMessage: null,
                      displayTimestamp: false,
                      textSize: 16,
                      hideDeletedMessages: false,
                      cheerEmotes: const [],
                      thirdPartEmotes: const [],
                      showPlatformBadge: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Subscriptions",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: controller.homeViewController.settings.value
                              .chatEventsSettings!.subscriptions,
                          onChanged: (value) {
                            controller.homeViewController.settings.value =
                                controller.homeViewController.settings.value
                                    .copyWith(
                              chatEventsSettings: controller.homeViewController
                                  .settings.value.chatEventsSettings!
                                  .copyWith(
                                subscriptions: value,
                              ),
                            );
                            controller.saveSettings();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                ),
                Column(
                  children: [
                    EventContainer(
                      message: entity.ChatMessage.fromTwitch(
                        BitDonation.randomGeneration(),
                        '',
                      ),
                      selectedMessage: null,
                      displayTimestamp: false,
                      textSize: 16,
                      hideDeletedMessages: false,
                      cheerEmotes: const [],
                      thirdPartEmotes: const [],
                      showPlatformBadge: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Bits donations",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: controller.homeViewController.settings.value
                              .chatEventsSettings!.bitsDonations,
                          onChanged: (value) {
                            controller.homeViewController.settings.value =
                                controller.homeViewController.settings.value
                                    .copyWith(
                              chatEventsSettings: controller.homeViewController
                                  .settings.value.chatEventsSettings!
                                  .copyWith(
                                bitsDonations: value,
                              ),
                            );
                            controller.saveSettings();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                ),
                Column(
                  children: [
                    EventContainer(
                      message: entity.ChatMessage.fromTwitch(
                        Announcement.randomGeneration(),
                        '',
                      ),
                      selectedMessage: null,
                      displayTimestamp: false,
                      textSize: 16,
                      hideDeletedMessages: false,
                      cheerEmotes: const [],
                      thirdPartEmotes: const [],
                      showPlatformBadge: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Announcements",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: controller.homeViewController.settings.value
                              .chatEventsSettings!.announcements,
                          onChanged: (value) {
                            controller.homeViewController.settings.value =
                                controller.homeViewController.settings.value
                                    .copyWith(
                              chatEventsSettings: controller.homeViewController
                                  .settings.value.chatEventsSettings!
                                  .copyWith(
                                announcements: value,
                              ),
                            );
                            controller.saveSettings();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                ),
                Column(
                  children: [
                    EventContainer(
                      message: entity.ChatMessage.fromTwitch(
                        IncomingRaid.randomGeneration(),
                        '',
                      ),
                      selectedMessage: null,
                      displayTimestamp: false,
                      textSize: 16,
                      hideDeletedMessages: false,
                      cheerEmotes: const [],
                      thirdPartEmotes: const [],
                      showPlatformBadge: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Incoming raids",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: controller.homeViewController.settings.value
                              .chatEventsSettings!.incomingRaids,
                          onChanged: (value) {
                            controller.homeViewController.settings.value =
                                controller.homeViewController.settings.value
                                    .copyWith(
                              chatEventsSettings: controller.homeViewController
                                  .settings.value.chatEventsSettings!
                                  .copyWith(
                                incomingRaids: value,
                              ),
                            );
                            controller.saveSettings();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const Divider(
                  height: 20,
                ),
                Column(
                  children: [
                    EventContainer(
                      message: entity.ChatMessage.fromTwitch(
                        RewardRedemption.randomGeneration(),
                        '',
                      ),
                      selectedMessage: null,
                      displayTimestamp: false,
                      textSize: 16,
                      hideDeletedMessages: false,
                      cheerEmotes: const [],
                      thirdPartEmotes: const [],
                      showPlatformBadge: false,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Channelpoint redemptions",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        Switch(
                          value: controller.homeViewController.settings.value
                              .chatEventsSettings!.redemptions,
                          onChanged: (value) {
                            controller.homeViewController.settings.value =
                                controller.homeViewController.settings.value
                                    .copyWith(
                              chatEventsSettings: controller.homeViewController
                                  .settings.value.chatEventsSettings!
                                  .copyWith(
                                redemptions: value,
                              ),
                            );
                            controller.saveSettings();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
