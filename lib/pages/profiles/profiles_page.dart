import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilesPage extends ConsumerWidget {
  const ProfilesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profiles'),
      ),
      body: const Center(
        child: Text('Profiles'),
      ),
    );
  }
}
