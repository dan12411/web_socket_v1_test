import 'package:json_annotation/json_annotation.dart';

part 'realtime_message_data.g.dart';

@JsonSerializable(createToJson: false)
class RealtimeMessageData {
  const RealtimeMessageData({required this.message});

  final String message;

  factory RealtimeMessageData.fromJson(Map<String, dynamic> json) => _$RealtimeMessageDataFromJson(json);
}
