import 'package:firechats/providers/router_provider.dart';
import 'package:firechats/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  @override
  Widget build(BuildContext context) {
    ref.listen(userProvider, (previous, next) {
      if (next != null) {
        ref.watch(routerProvider).go('/');
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
