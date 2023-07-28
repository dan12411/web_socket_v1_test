import 'package:json_annotation/json_annotation.dart';
import 'package:web_socket_v1_test/main.dart';
import 'package:web_socket_v1_test/realtime_v1_channel_type.dart';

part 'realtime_response.g.dart';

@JsonSerializable(genericArgumentFactories: true, createToJson: false)
class RealtimeResponse<T> {
  const RealtimeResponse({
    required this.event,
    this.data,
    this.id,
    this.channel,
  });

  factory RealtimeResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) =>
      _$RealtimeResponseFromJson(json, fromJsonT);

  final RealtimeResponseEvent event;
  final T? data;
  final String? id;
  final RealtimeV1ChannelType? channel;
}
