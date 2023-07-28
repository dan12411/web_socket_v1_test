import 'package:json_annotation/json_annotation.dart';

part 'realtime_auth_data.g.dart';

@JsonSerializable(createFactory: false)
class RealtimeAuthData {
  const RealtimeAuthData({required this.token});

  final String token;

  Map<String, dynamic> toJson() => _$RealtimeAuthDataToJson(this);
}
