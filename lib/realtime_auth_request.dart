import 'package:web_socket_v1_test/main.dart';
import 'package:web_socket_v1_test/realtime_auth_data.dart';
import 'package:web_socket_v1_test/realtime_request.dart';

class RealtimeAuthRequest extends RealtimeRequest<RealtimeAuthData> {
  RealtimeAuthRequest({required this.token})
      : super(
          event: RealtimeRequestEvent.auth,
          data: RealtimeAuthData(token: token),
        );

  final String token;

  String toJsonString() => toJson((data) => data.toJson()).mapString;
}
