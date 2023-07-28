import 'package:web_socket_v1_test/main.dart';
import 'package:web_socket_v1_test/realtime_response.dart';
import 'package:web_socket_v1_test/realtime_unsubscribed_data.dart';

class RealtimeUnsubscribedResponse extends RealtimeResponse<List<RealtimeUnsubscribedData>> {
  const RealtimeUnsubscribedResponse({required this.unsubscribedData})
      : super(
          event: RealtimeResponseEvent.subscribed,
          data: unsubscribedData,
        );

  final List<RealtimeUnsubscribedData> unsubscribedData;

  factory RealtimeUnsubscribedResponse.fromJson(Map<String, dynamic> json) {
    final response = RealtimeResponse<List<RealtimeUnsubscribedData>>.fromJson(json, (value) {
      final list = value as List<dynamic>;
      return list.map((e) => RealtimeUnsubscribedData.fromJson(e as Map<String, dynamic>)).toList();
    });

    return RealtimeUnsubscribedResponse(unsubscribedData: response.data ?? []);
  }
}
