import 'package:json_annotation/json_annotation.dart';

part 'realtime_unsubscribed_data.g.dart';

@JsonSerializable(createToJson: false)
class RealtimeUnsubscribedData {
  const RealtimeUnsubscribedData({required this.id});

  final String id;

  factory RealtimeUnsubscribedData.fromJson(Map<String, dynamic> json) => _$RealtimeUnsubscribedDataFromJson(json);
}
