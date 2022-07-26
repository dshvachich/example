import 'dart:async';
import 'dart:convert';

import 'package:power_bank/core/network/network_info.dart';
import 'package:power_bank/data/gateways/local/preferences_local_gateway.dart';
import 'package:power_bank/domain/entities/network/product_rent.dart';
import 'package:rxdart/subjects.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketManager {
  WebSocketManager({
    required this.preferencesLocalGateway,
    required this.networkInfo,
  });

  static const url = 'ws://rugetpower.ru:8502';

  PreferencesLocalGateway preferencesLocalGateway;
  NetworkInfo networkInfo;

  BehaviorSubject<ProductRent?> _completeRentSubject = BehaviorSubject.seeded(null);
  BehaviorSubject<ProductRent?> _failRentSubject = BehaviorSubject.seeded(null);
  Stream<ProductRent?> get completeRentStream => _completeRentSubject.stream;
  Stream<ProductRent?> get failRentStream => _failRentSubject.stream;

  IOWebSocketChannel? webSocketChannel;

  Timer? _restartTimer;
  Timer? _pingTimer;
  bool _isStarted = false;

  void _reloadWithDelay() {
    _restartTimer?.cancel();
    _restartTimer = Timer.periodic(Duration(seconds: 1), (timer) async {
      timer.cancel();
      startSockets();
    });
  }

  void startSockets() async {
    stopSockets();
    String? token = await preferencesLocalGateway.getToken();
    if (token == null) {
      return;
    }
    var socketURL = url + "?accessToken=$token";
    try {
      _isStarted = true;
      webSocketChannel = IOWebSocketChannel.connect(
        socketURL,
        pingInterval: Duration(seconds: 2),
      );
    } catch (e) {
      print('');
    }
    webSocketChannel?.stream.listen(
      (message) {
        _parseSocketMessage(message);
      },
      onDone: () {
        print('');
        if (_isStarted) {
          _reloadWithDelay();
        }
      },
      onError: (error) {
        print('');
        _reloadWithDelay();
      },
    );
    _pingTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      _checkConnection();
    });
  }

  void _parseSocketMessage(String message) {
    dynamic messageMap = json.decode(message);
    if (messageMap == null) return;
    switch (messageMap["type"]) {
      case "completeRent":
        ProductRent productRent = ProductRent.fromJson(messageMap);
        _completeRentSubject.add(productRent);
        break;
      case "failRent":
        ProductRent failRent = ProductRent.fromJson(messageMap['productRent']);
        _failRentSubject.add(failRent);
        break;
      default:
    }
  }

  void stopSockets() {
    _isStarted = false;
    _pingTimer?.cancel();
    _restartTimer?.cancel();
    if (webSocketChannel != null) {
      webSocketChannel?.sink.close();
    }
  }

  Future<void> _checkConnection() async {
    bool connected = await (networkInfo.isConnected);
    if (!connected) {
      _reloadWithDelay();
    }
  }
}
