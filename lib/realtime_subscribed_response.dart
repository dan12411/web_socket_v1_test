import 'package:web_socket_v1_test/main.dart';
import 'package:web_socket_v1_test/realtime_response.dart';
import 'package:web_socket_v1_test/realtime_subscribed_data.dart';

class RealtimeSubscribedResponse extends RealtimeResponse<List<RealtimeSubscribedData>> {
  const RealtimeSubscribedResponse({required this.subscribedData})
      : super(event: RealtimeResponseEvent.subscribed, data: subscribedData);

  final List<RealtimeSubscribedData> subscribedData;

  factory RealtimeSubscribedResponse.fromJson(Map<String, dynamic> json) {
    final response = RealtimeResponse<List<RealtimeSubscribedData>>.fromJson(json, (value) {
      final list = value as List;
      return list.map((e) => RealtimeSubscribedData.fromJson(e as Map<String, dynamic>)).toList();
    });

    return RealtimeSubscribedResponse(subscribedData: response.data ?? []);
  }
}
