import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_sample/core/themes/light_mode.dart';
import 'package:flutter_app_sample/features/auth/presentation/provider/auth_provider.dart';
import 'package:flutter_app_sample/features/auth/presentation/provider/user_provider.dart';
import 'package:flutter_app_sample/features/main/presentation/main_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  await dotenv.load();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppLinks _appLinks = AppLinks();
  final logger = Logger();
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Castify Studio',
      navigatorKey: navigatorKey,
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
      theme: lightMode,
    );
  }
}