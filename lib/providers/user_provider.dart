import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firechats/providers/router_provider.dart';
import 'package:firechats/serializables/serializers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../serializables/users.dart';

abstract class UserProvider {
  static Users? currentUser;
}

final userProvider = StreamProvider<Users?>((ref) {
  final auth = FirebaseAuth.instance;

  return auth.userChanges().asyncMap((u) async {
    if (u == null) {
      ref.watch(routerProvider).go('/login');
      return null;
    }

    final userRef = Users.doc(u.uid);
    final user = await userRef.get();
    if (!user.exists) {
      final newUser = Users(
        (q) => q
          ..uid = u.uid
          ..email = u.email
          ..username = u.email
          ..avatar = u.photoURL
          ..nickname = u.displayName
          ..createdAt = Timestamp.fromDate(
            u.metadata.creationTime ?? DateTime.now(),
          )
          ..birthday = Timestamp.now()
          ..bio = '',
      );
      await userRef.set(newUser.toJson());
      final userRecord = newUser.rebuild(
        (q) => q..reference = userRef,
      );
      UserProvider.currentUser = userRecord;
      return userRecord;
    }

    final userRecord = await FirestoreUtil.getDocumentWithConvertor(user,
        convertor: Users.fromJson);
    UserProvider.currentUser = userRecord;
    return userRecord;
  });
});

final currentUserProvider = StreamProvider<Users?>((ref) {
  final asyncUser = ref.watch(userProvider);
  if (asyncUser.value == null) {
    return const Stream.empty();
  }

  final snap = asyncUser.value!.reference!.snapshots();

  return snap.asyncMap(
    (val) =>
        FirestoreUtil.getDocumentWithConvertor(val, convertor: Users.fromJson),
  );
});
