import 'package:json_annotation/json_annotation.dart';

part 'realtime_unsubscribe_data.g.dart';

@JsonSerializable(createFactory: false)
class RealtimeUnsubscribeData {
  const RealtimeUnsubscribeData({required this.ids});

  final List<String> ids;

  Map<String, dynamic> toJson() => _$RealtimeUnsubscribeDataToJson(this);
}
