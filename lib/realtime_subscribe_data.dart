import 'package:json_annotation/json_annotation.dart';

part 'realtime_subscribe_data.g.dart';

@JsonSerializable(createFactory: false)
class RealtimeSubscribeData {
  const RealtimeSubscribeData({
    required this.channel,
    required this.symbols,
  });

  final String channel;
  final List<String> symbols;

  Map<String, dynamic> toJson() => _$RealtimeSubscribeDataToJson(this);
}
