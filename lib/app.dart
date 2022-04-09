import 'package:firechats/pages/chats/chats_page.dart';
import 'package:firechats/pages/contacts/contacts_page.dart';
import 'package:firechats/pages/profiles/profiles_page.dart';
import 'package:firechats/providers/router_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppTabs { chats, contacts, profiles }

class AppScaffold extends ConsumerStatefulWidget {
  const AppScaffold({
    Key? key,
    this.selectedTab = AppTabs.chats,
  }) : super(key: key);

  final AppTabs selectedTab;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends ConsumerState<AppScaffold> {
  static const pages = [
    ChatsPage(),
    ContactsPage(),
    ProfilesPage(),
  ];

  AppTabs get currentTab => widget.selectedTab;

  @override
  Widget build(BuildContext context) {
    final pageIndex = currentTab.index;

    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomNavigator(
        current: currentTab,
      ),
    );
  }
}

class BottomNavigator extends ConsumerWidget {
  const BottomNavigator({
    Key? key,
    this.current = AppTabs.chats,
  }) : super(key: key);

  final AppTabs current;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      currentIndex: current.index,
      onTap: (index) {
        final page = describeEnum(AppTabs.values[index]);
        ref.watch(routerProvider).go('/$page');
      },
      items: const [
        BottomNavigationBarItem(
          label: 'Chats',
          icon: Icon(Icons.chat),
        ),
        BottomNavigationBarItem(
          label: 'Contacts',
          icon: Icon(Icons.people),
        ),
        BottomNavigationBarItem(
          label: 'Settings',
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }
}
