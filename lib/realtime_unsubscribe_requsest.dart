import 'package:web_socket_v1_test/main.dart';
import 'package:web_socket_v1_test/realtime_request.dart';
import 'package:web_socket_v1_test/realtime_unsubscribe_data.dart';

class RealtimeUnsubscribeRequest extends RealtimeRequest<RealtimeUnsubscribeData> {
  RealtimeUnsubscribeRequest({required this.ids})
      : super(
          event: RealtimeRequestEvent.unsubscribe,
          data: RealtimeUnsubscribeData(ids: ids),
        );

  final List<String> ids;

  String toJsonString() => toJson((data) => data.toJson()).mapString;
}
