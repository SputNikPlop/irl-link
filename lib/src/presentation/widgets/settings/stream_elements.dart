import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/settings_view_controller.dart';

class StreamElements extends GetView {
  const StreamElements({
    super.key,
    required this.controller,
  });

  @override
  final SettingsViewController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'StreamElements',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge!.color,
                fontSize: 18,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              margin: const EdgeInsets.only(left: 4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Wrap(
                children: [
                  Text(
                    "Premium feature",
                    style: TextStyle(
                      color: Theme.of(context).textTheme.bodyLarge!.color,
                      fontSize: 12,
                    ),
                  ),
                  const Icon(
                    CupertinoIcons.sparkles,
                    size: 12,
                    color: Colors.yellow,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
            color: Theme.of(context).colorScheme.secondary,
          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage("lib/assets/streamelements/seLogo.png"),
                    width: 30,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    onTap: (() => {controller.loginStreamElements()}),
                    child: const Text(
                      'Login with StreamElements',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
