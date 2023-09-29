import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/socket.dart';

class Status extends StatelessWidget {
  const Status({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final socket = Provider.of<Socket>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Status: ${socket.serverStatus}'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          socket.socket.emit('emitir-mensaje',
              {'nombre': 'flutter', 'mensaje': 'hola desde flutter'});
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
