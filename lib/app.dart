import 'package:firechats/pages/chats/chats_page.dart';
import 'package:firechats/pages/contacts/contacts_page.dart';
import 'package:firechats/pages/profiles/profiles_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainIndexed extends ConsumerWidget {
  const MainIndexed({
    Key? key,
  }) : super(key: key);

  static const pages = [
    ChatsPage(),
    ContactsPage(),
    ProfilesPage(),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: pages[0],
      bottomNavigationBar: const BottomNavigator(),
    );
  }
}

class BottomNavigator extends ConsumerWidget {
  const BottomNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}
