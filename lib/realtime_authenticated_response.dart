import 'package:web_socket_v1_test/main.dart';
import 'package:web_socket_v1_test/realtime_message_data.dart';
import 'package:web_socket_v1_test/realtime_response.dart';

class RealtimeAuthenticatedResponse extends RealtimeResponse<RealtimeMessageData> {
  const RealtimeAuthenticatedResponse({required this.messageData})
      : super(
          event: RealtimeResponseEvent.authenticated,
          data: messageData,
        );

  factory RealtimeAuthenticatedResponse.fromJson(Map<String, dynamic> json) {
    final response = RealtimeResponse<RealtimeMessageData>.fromJson(
        json, (value) => RealtimeMessageData.fromJson(value as Map<String, dynamic>));
    return RealtimeAuthenticatedResponse(messageData: response.data ?? const RealtimeMessageData(message: ''));
  }

  final RealtimeMessageData messageData;
}
