import 'package:cached_network_image/cached_network_image.dart';
import 'package:firechats/providers/user_provider.dart';
import 'package:firechats/widgets/logout_dialog.dart';
import 'package:firechats/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfilesPage extends ConsumerWidget {
  const ProfilesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(currentUserProvider);

    return asyncUser.maybeWhen(
      orElse: () => const LoadingPage(),
      data: (user) {
        user!;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Profiles'),
          ),
          body: Center(
            child: Column(
              children: [
                const SizedBox(height: 32),
                CirclePicture(
                  url: user.avatar!,
                  radius: 40,
                ),
                const SizedBox(height: 12),
                Text('${user.nickname}'),
                ListTile(
                  onTap: () async {
                    LogoutDialog.show(context);
                  },
                  title: const Text('Logout'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class CirclePicture extends StatelessWidget {
  const CirclePicture({
    Key? key,
    required this.url,
    this.radius = 30,
  }) : super(key: key);

  final String url;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: CachedNetworkImage(
        imageUrl: url,
        width: radius * 2,
        height: radius * 2,
        fit: BoxFit.fill,
      ),
    );
  }
}
