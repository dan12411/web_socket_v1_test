// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'realtime_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RealtimeResponse<T> _$RealtimeResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    RealtimeResponse<T>(
      event: $enumDecode(_$RealtimeResponseEventEnumMap, json['event']),
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      id: json['id'] as String?,
      channel: $enumDecodeNullable(_$RealtimeV1ChannelEnumMap, json['channel']),
    );

const _$RealtimeResponseEventEnumMap = {
  RealtimeResponseEvent.authenticated: 'authenticated',
  RealtimeResponseEvent.subscribed: 'subscribed',
  RealtimeResponseEvent.unsubscribed: 'unsubscribed',
  RealtimeResponseEvent.snapshot: 'snapshot',
  RealtimeResponseEvent.data: 'data',
  RealtimeResponseEvent.error: 'error',
};

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

const _$RealtimeV1ChannelEnumMap = {
  RealtimeV1ChannelType.trades: 'trades',
  RealtimeV1ChannelType.candles: 'candles',
};
