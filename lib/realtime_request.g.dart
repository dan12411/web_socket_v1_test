// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$RealtimeRequestToJson<T>(
  RealtimeRequest<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'event': _$RealtimeRequestEventEnumMap[instance.event]!,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
    };

const _$RealtimeRequestEventEnumMap = {
  RealtimeRequestEvent.auth: 'auth',
  RealtimeRequestEvent.subscribe: 'subscribe',
  RealtimeRequestEvent.unsubscribe: 'unsubscribe',
};

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
