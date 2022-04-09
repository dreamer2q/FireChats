import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ChatsPage extends ConsumerWidget {
  const ChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
      ),
      body: const Center(
        child: Text('Chats'),
      ),
    );
  }
}
