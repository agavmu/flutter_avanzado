import 'package:flutter/material.dart';

import 'package:socket_io_client/socket_io_client.dart' as io;

enum ServerStatus { online, offline, connecting }

class Socket with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.connecting;
  late io.Socket _socket;

  ServerStatus get serverStatus => _serverStatus;
  io.Socket get socket => _socket;

  Function get emit => _socket.emit;

  // ServerStatus get serverStatus => _serverStatus;

  Socket() {
    _initConfig();
  }

  void _initConfig() {
    // Dart client
    _socket = io.io(
      'http://192.168.1.120:3000/',
      {
        'transports': ['websocket'],
        'autoconnect': true
      },
    );
    _socket.onConnect((_) {
      _serverStatus = ServerStatus.online;
      notifyListeners();
    });

    _socket.onDisconnect((_) {
      _serverStatus = ServerStatus.offline;
      notifyListeners();
    });
  }
}
