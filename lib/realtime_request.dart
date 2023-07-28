import 'package:json_annotation/json_annotation.dart';
import 'package:web_socket_v1_test/main.dart';

part 'realtime_request.g.dart';

@JsonSerializable(genericArgumentFactories: true, createFactory: false)
class RealtimeRequest<T> {
  const RealtimeRequest({required this.event, required this.data});

  final RealtimeRequestEvent event;

  final T? data;

  Map<String, dynamic> toJson(Object Function(T value) toJsonT) => _$RealtimeRequestToJson(this, toJsonT);
}
