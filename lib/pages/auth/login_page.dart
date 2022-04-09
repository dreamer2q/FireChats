import 'package:firechats/providers/router_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.listen(userProvider, (previous, next) {
      debugPrint('userChange: ${next}');
      if (previous == null && next != null) {
        // ref.watch(routerProvider).go('/');
      }
    });

    return SignInScreen(
      headerBuilder: (context, constraints, offset) {
        return const Text('Sign In');
      },
      providerConfigs: const [
        GoogleProviderConfiguration(
          clientId:
              '876678903441-fsg934khrj1qvccpobk64cgfb4a73gbq.apps.googleusercontent.com',
        ),
      ],
    );
  }
}
