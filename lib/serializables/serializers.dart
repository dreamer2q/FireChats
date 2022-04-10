import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firechats/serializables/users.dart';

part 'serializers.g.dart';

const kDocumentReference = '_kDocumentReference';

@SerializersFor([
  Users,
])
final Serializers serializers = (_$serializers.toBuilder()
      ..add(DocumentReferenceSerializer())
      ..add(DateTimeSerializer())
      ..add(TimestampSerializer())
      ..add(DynamicSerializer())
      ..addPlugin(StandardJsonPlugin()))
    .build();

class DocumentReferenceSerializer
    implements PrimitiveSerializer<DocumentReference> {
  final bool structured = false;
  @override
  final Iterable<Type> types = BuiltList<Type>([DocumentReference]);
  @override
  final String wireName = 'DocumentReference';

  @override
  Object serialize(
    Serializers serializers,
    DocumentReference reference, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return reference;
  }

  @override
  DocumentReference deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) =>
      serialized as DocumentReference;
}

class DateTimeSerializer implements PrimitiveSerializer<DateTime> {
  @override
  final Iterable<Type> types = BuiltList<Type>([DateTime]);
  @override
  final String wireName = 'DateTime';

  @override
  Object serialize(
    Serializers serializers,
    DateTime dateTime, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return dateTime;
  }

  @override
  DateTime deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    if (serialized is Timestamp) {
      return serialized.toDate();
    }
    return serialized as DateTime;
  }
}

class TimestampSerializer implements PrimitiveSerializer<Timestamp> {
  @override
  final Iterable<Type> types = BuiltList<Type>([Timestamp]);

  @override
  final String wireName = 'Timestamp';

  @override
  Object serialize(
    Serializers serializers,
    Timestamp timestamp, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return timestamp;
  }

  @override
  Timestamp deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) {
    if (serialized is DateTime) {
      return Timestamp.fromDate(serialized);
    }
    return serialized as Timestamp;
  }
}

class DynamicSerializer implements PrimitiveSerializer<dynamic> {
  final bool structured = false;
  @override
  final Iterable<Type> types = BuiltList<Type>([dynamic]);
  @override
  final String wireName = 'dynamic';

  @override
  Object serialize(
    Serializers serializers,
    dynamic value, {
    FullType specifiedType = FullType.unspecified,
  }) {
    return value;
  }

  @override
  dynamic deserialize(
    Serializers serializers,
    Object serialized, {
    FullType specifiedType = FullType.unspecified,
  }) =>
      serialized as dynamic;
}

DocumentReference toRef(String ref) => FirebaseFirestore.instance.doc(ref);

abstract class FirestoreUtil {
  static Future<T> getDocumentWithConvertor<T>(
    Object? data, {
    required T Function(Map<String, dynamic> data) convertor,
    int depth = 1,
  }) async {
    final value = await getDocumentValue(data, depth);
    return convertor(value as Map<String, dynamic>);
  }

  static Future<Object?> getDocumentValue(Object? data, [int depth = 1]) async {
    if (data == null) return null;

    if (depth == 0) {
      return data;
    }

    if (data is Map) {
      return await getDocumentWithRef(data, depth);
    } else if (data is List) {
      return await Future.wait(
        data.map((value) => getDocumentValue(value, depth - 1)),
      );
    } else if (data is DocumentSnapshot) {
      final ref = data.data();
      final value = await getDocumentValue(ref, depth);
      if (value is Map) {
        value[kDocumentReference] = data.reference;
      }
      return value;
    } else if (data is QueryDocumentSnapshot) {
      final ref = data.data();
      final value = await getDocumentValue(ref, depth);
      if (value is Map) {
        value[kDocumentReference] = data.reference;
      }
      return value;
    } else if (data is DocumentReference) {
      final ref = await data.get();
      final doc = ref.data();
      return await getDocumentValue(doc, depth - 1);
    } else {
      return await data;
    }
  }

  static Future<Map> getDocumentWithRef(
    Map document, [
    int depth = 1,
  ]) async {
    if (depth == 0) {
      return document;
    }

    final newDoc = <String, dynamic>{};

    for (final key in document.keys) {
      final value = document[key];
      if (value is DocumentReference) {
        final ref = await value.get();
        final doc = ref.data();
        final val = await getDocumentValue(doc, depth - 1);
        assert(key is String, 'key is not type of string');
        if (key is String && key.endsWith('_ref')) {
          newDoc[key] = value;
          newDoc[key.replaceAll('_ref', '')] = val;
        } else {
          newDoc[key] = val;
        }
        if (val is Map) {
          val[kDocumentReference] = value;
        }
      } else {
        final val = await getDocumentValue(value, depth - 1);
        newDoc[key] = val;
      }
    }

    return newDoc;
  }
}
