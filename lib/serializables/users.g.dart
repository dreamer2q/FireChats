// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<Users> _$usersSerializer = new _$UsersSerializer();

class _$UsersSerializer implements StructuredSerializer<Users> {
  @override
  final Iterable<Type> types = const [Users, _$Users];
  @override
  final String wireName = 'Users';

  @override
  Iterable<Object?> serialize(Serializers serializers, Users object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.uid;
    if (value != null) {
      result
        ..add('uid')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.email;
    if (value != null) {
      result
        ..add('email')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.username;
    if (value != null) {
      result
        ..add('username')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nickname;
    if (value != null) {
      result
        ..add('nickname')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.phoneNumber;
    if (value != null) {
      result
        ..add('phone_number')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.bio;
    if (value != null) {
      result
        ..add('bio')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.birthday;
    if (value != null) {
      result
        ..add('birthday')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Timestamp)));
    }
    value = object.avatar;
    if (value != null) {
      result
        ..add('avatar')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(Timestamp)));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('_kDocumentReference')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  Users deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new UsersBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'uid':
          result.uid = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'email':
          result.email = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'username':
          result.username = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'nickname':
          result.nickname = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'phone_number':
          result.phoneNumber = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'bio':
          result.bio = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'birthday':
          result.birthday = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp?;
          break;
        case 'avatar':
          result.avatar = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(Timestamp)) as Timestamp?;
          break;
        case '_kDocumentReference':
          result.reference = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$Users extends Users {
  @override
  final String? uid;
  @override
  final String? email;
  @override
  final String? username;
  @override
  final String? nickname;
  @override
  final String? phoneNumber;
  @override
  final String? bio;
  @override
  final Timestamp? birthday;
  @override
  final String? avatar;
  @override
  final Timestamp? createdAt;
  @override
  final DocumentReference<Object?>? reference;

  factory _$Users([void Function(UsersBuilder)? updates]) =>
      (new UsersBuilder()..update(updates)).build();

  _$Users._(
      {this.uid,
      this.email,
      this.username,
      this.nickname,
      this.phoneNumber,
      this.bio,
      this.birthday,
      this.avatar,
      this.createdAt,
      this.reference})
      : super._();

  @override
  Users rebuild(void Function(UsersBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  UsersBuilder toBuilder() => new UsersBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Users &&
        uid == other.uid &&
        email == other.email &&
        username == other.username &&
        nickname == other.nickname &&
        phoneNumber == other.phoneNumber &&
        bio == other.bio &&
        birthday == other.birthday &&
        avatar == other.avatar &&
        createdAt == other.createdAt &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc($jc(0, uid.hashCode), email.hashCode),
                                    username.hashCode),
                                nickname.hashCode),
                            phoneNumber.hashCode),
                        bio.hashCode),
                    birthday.hashCode),
                avatar.hashCode),
            createdAt.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('Users')
          ..add('uid', uid)
          ..add('email', email)
          ..add('username', username)
          ..add('nickname', nickname)
          ..add('phoneNumber', phoneNumber)
          ..add('bio', bio)
          ..add('birthday', birthday)
          ..add('avatar', avatar)
          ..add('createdAt', createdAt)
          ..add('reference', reference))
        .toString();
  }
}

class UsersBuilder implements Builder<Users, UsersBuilder> {
  _$Users? _$v;

  String? _uid;
  String? get uid => _$this._uid;
  set uid(String? uid) => _$this._uid = uid;

  String? _email;
  String? get email => _$this._email;
  set email(String? email) => _$this._email = email;

  String? _username;
  String? get username => _$this._username;
  set username(String? username) => _$this._username = username;

  String? _nickname;
  String? get nickname => _$this._nickname;
  set nickname(String? nickname) => _$this._nickname = nickname;

  String? _phoneNumber;
  String? get phoneNumber => _$this._phoneNumber;
  set phoneNumber(String? phoneNumber) => _$this._phoneNumber = phoneNumber;

  String? _bio;
  String? get bio => _$this._bio;
  set bio(String? bio) => _$this._bio = bio;

  Timestamp? _birthday;
  Timestamp? get birthday => _$this._birthday;
  set birthday(Timestamp? birthday) => _$this._birthday = birthday;

  String? _avatar;
  String? get avatar => _$this._avatar;
  set avatar(String? avatar) => _$this._avatar = avatar;

  Timestamp? _createdAt;
  Timestamp? get createdAt => _$this._createdAt;
  set createdAt(Timestamp? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _reference;
  DocumentReference<Object?>? get reference => _$this._reference;
  set reference(DocumentReference<Object?>? reference) =>
      _$this._reference = reference;

  UsersBuilder() {
    Users._initializeBuilder(this);
  }

  UsersBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid = $v.uid;
      _email = $v.email;
      _username = $v.username;
      _nickname = $v.nickname;
      _phoneNumber = $v.phoneNumber;
      _bio = $v.bio;
      _birthday = $v.birthday;
      _avatar = $v.avatar;
      _createdAt = $v.createdAt;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Users other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Users;
  }

  @override
  void update(void Function(UsersBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$Users build() {
    final _$result = _$v ??
        new _$Users._(
            uid: uid,
            email: email,
            username: username,
            nickname: nickname,
            phoneNumber: phoneNumber,
            bio: bio,
            birthday: birthday,
            avatar: avatar,
            createdAt: createdAt,
            reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
