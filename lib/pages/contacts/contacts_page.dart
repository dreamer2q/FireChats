import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactsPage extends ConsumerWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
      body: const Center(
        child: Text('Contacts'),
      ),
    );
  }
}
