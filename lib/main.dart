import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movieapp/Router/router.dart';
import 'package:movieapp/Theme/theme.dart';
import 'package:provider/provider.dart';

import 'Shared/Providers/movies_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Color(0xffFFFFFF),
    ),
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
        ),
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

  @override
  void initState() {
    
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme:theme,
      themeMode: ThemeMode.light,
      routerConfig: router,
    );
  }
}
