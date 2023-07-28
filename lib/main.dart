import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_v1_test/realtime_auth_request.dart';
import 'package:web_socket_v1_test/realtime_authenticated_response.dart';
import 'package:web_socket_v1_test/realtime_subscribe_request.dart';
import 'package:web_socket_v1_test/realtime_subscribed_response.dart';
import 'package:web_socket_v1_test/realtime_unsubscribe_requsest.dart';
import 'package:web_socket_v1_test/realtime_unsubscribed_response.dart';
import 'package:web_socket_v1_test/realtime_v1_channel_type.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'WebSocket Demo';
    return const MaterialApp(
      title: title,
      home: MyHomePage(
        title: title,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _channel = WebSocketChannel.connect(
    Uri.parse('wss://api.fugle.tw/marketdata/v1.0/stock/streaming'),
  );

  @override
  void initState() {
    final event = RealtimeAuthRequest(token: 'KEY-IN-YOUR-TOKEN');

    print(event.toJsonString());
    _channel.sink.add(event.toJsonString());

    super.initState();
  }

  String? id;
  Map<String, String> tradeMap = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              StreamBuilder(
                stream: _channel.stream,
                builder: (context, snapshot) {
                  final hasData = snapshot.hasData;
                  if (!hasData) return const SizedBox.shrink();
                  const encoder = JsonEncoder.withIndent("    ");
                  final Map<String, dynamic> json = jsonDecode(snapshot.data);
                  log(json.toString());

                  final RealtimeV1ChannelType? channel = _getChannel(json);
                  final RealtimeResponseEvent? event = _getEvent(json);

                  if (event != null && channel != null) {
                    _handleChannel(event, channel, json);
                  } else if (event != null) {
                    _handleEventOnly(event, json);
                  }

                  return Text(encoder.convert(json));
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _unsubscribe(['m4QEmn9LnLFzWoO5Wox3tZrpEgKmJDFZBlnXYDjVUPz']),
        tooltip: 'Unsubscribe',
        child: const Icon(Icons.delete),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => _subscribe(['0050']),
      //   tooltip: 'subscribe',
      //   child: const Icon(Icons.add),
      // ), //
    );
  }

  RealtimeV1ChannelType? _getChannel(Map<String, dynamic> json) =>
      RealtimeV1ChannelType.values.asNameMap()[json['channel'] as String? ?? ''];

  RealtimeResponseEvent? _getEvent(Map<String, dynamic> json) =>
      RealtimeResponseEvent.values.asNameMap()[json['event'] as String? ?? ''];

  void _handleChannel(RealtimeResponseEvent event, RealtimeV1ChannelType channel, Map<String, dynamic> json) {
    switch (channel) {
      case RealtimeV1ChannelType.trades:
        break;
      case RealtimeV1ChannelType.candles:
        break;
    }
  }

  void _handleEventOnly(RealtimeResponseEvent event, Map<String, dynamic> json) {
    switch (event) {
      case RealtimeResponseEvent.authenticated:
        final res = RealtimeAuthenticatedResponse.fromJson(json);
        _subscribe(['0050']);

        // Future.delayed(const Duration(seconds: 1), () {
        //   _subscribe(['0056', '2330']);
        // });

        break;
      case RealtimeResponseEvent.subscribed:
        final res = RealtimeSubscribedResponse.fromJson(json);
        tradeMap['0050'] = res.subscribedData.first.id;
        break;
      case RealtimeResponseEvent.unsubscribed:
        final res = RealtimeUnsubscribedResponse.fromJson(json);
        tradeMap['0050'] = res.unsubscribedData.first.id;
        break;
      case RealtimeResponseEvent.error:
        // TODO: Handle this case.
        print('error occur !!');
        break;
      default:
        break;
    }
  }

  void _subscribe(List<String> symbols) {
    final request = RealtimeSubscribeRequest(channel: 'candles', symbols: symbols);
    _channel.sink.add(request.toJsonString());
  }

  void _unsubscribe(List<String> channelIds) {
    final request = RealtimeUnsubscribeRequest(ids: channelIds);
    _channel.sink.add(request.toJsonString());
  }

  @override
  void dispose() {
    _channel.sink.close();
    super.dispose();
  }
}

extension MapConverter on Map {
  String get mapString {
    try {
      return jsonEncode(this);
    } catch (e) {
      debugPrint('Map: $this, could not convert to string');
      return toString();
    }
  }
}

enum RealtimeRequestEvent {
  auth,
  subscribe,
  unsubscribe,
}

enum RealtimeResponseEvent {
  authenticated,
  subscribed,
  unsubscribed,
  snapshot,
  data,
  error,
}
