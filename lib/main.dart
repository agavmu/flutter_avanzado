import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:votes_app/providers/socket.dart';

import 'package:votes_app/screens/status.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Socket(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        title: 'Votes App',
        initialRoute: 'home',
        routes: {
          'home': (_) => const HomeScreen(),
          'status': (_) => const Status(),
        },
      ),
    );
  }
}
