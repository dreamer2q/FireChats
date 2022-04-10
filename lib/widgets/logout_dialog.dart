import 'package:firebase_auth/firebase_auth.dart';
import 'package:firechats/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/router_provider.dart';

class LogoutDialog extends ConsumerWidget {
  static show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return const LogoutDialog();
      },
    );
  }

  const LogoutDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = S.of(context);
    return CupertinoAlertDialog(
      title: Text(s.logout),
      content: Text(s.logoutIntro),
      actions: [
        CupertinoActionSheetAction(
          isDestructiveAction: true,
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
          },
          child: Text(s.logoutConfirm),
        ),
        CupertinoActionSheetAction(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(s.logoutCancel),
        ),
      ],
    );
  }
}
