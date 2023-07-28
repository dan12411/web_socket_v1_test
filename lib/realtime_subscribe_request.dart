import 'package:web_socket_v1_test/main.dart';
import 'package:web_socket_v1_test/realtime_request.dart';
import 'package:web_socket_v1_test/realtime_subscribe_data.dart';

class RealtimeSubscribeRequest extends RealtimeRequest<RealtimeSubscribeData> {
  RealtimeSubscribeRequest({
    required this.channel,
    required this.symbols,
  }) : super(
          event: RealtimeRequestEvent.subscribe,
          data: RealtimeSubscribeData(channel: channel, symbols: symbols),
        );

  final String channel;
  final List<String> symbols;

  String toJsonString() => toJson((data) => data.toJson()).mapString;
}
