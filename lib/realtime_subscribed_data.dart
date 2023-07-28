import 'package:json_annotation/json_annotation.dart';

part 'realtime_subscribed_data.g.dart';

@JsonSerializable(createToJson: false)
class RealtimeSubscribedData {
  const RealtimeSubscribedData({
    required this.id,
    required this.channel,
    required this.symbol,
  });

  final String id;
  final String channel;
  final String symbol;

  factory RealtimeSubscribedData.fromJson(Map<String, dynamic> json) => _$RealtimeSubscribedDataFromJson(json);
}
