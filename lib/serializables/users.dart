import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'serializers.dart';

part 'users.g.dart';

abstract class Users implements Built<Users, UsersBuilder> {
  @BuiltValueField(wireName: 'uid')
  String? get uid;

  @BuiltValueField(wireName: 'email')
  String? get email;

  @BuiltValueField(wireName: 'username')
  String? get username;

  @BuiltValueField(wireName: 'nickname')
  String? get nickname;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'bio')
  String? get bio;

  @BuiltValueField(wireName: 'birthday')
  Timestamp? get birthday;

  @BuiltValueField(wireName: 'avatar')
  String? get avatar;

  @BuiltValueField(wireName: 'created_at')
  Timestamp? get createdAt;

  @BuiltValueField(wireName: kDocumentReference)
  DocumentReference? get reference;

  Users._();
  factory Users([void Function(UsersBuilder) updates]) = _$Users;

  static void _initializeBuilder(UsersBuilder b) => b
    ..uid = null
    ..email = null
    ..nickname = null
    ..bio = null
    ..birthday = Timestamp.now()
    ..avatar = null
    ..createdAt = Timestamp.now();

  Map<String, dynamic> toJson() {
    return serializers.serializeWith(Users.serializer, this)
        as Map<String, dynamic>;
  }

  static Users fromJson(Map<String, dynamic> json) {
    return serializers.deserializeWith(Users.serializer, json)!;
  }

  static DocumentReference doc(String uid) => collection.doc(uid);

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Serializer<Users> get serializer => _$usersSerializer;
}
