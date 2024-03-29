import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:kadasolutions/index.dart';
import 'package:go_router/go_router.dart';

void main() {
  registerServices();
  registerBlocs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final ApplicationConfig _applicationConfig = GetIt.instance.get<ApplicationConfig>();

  final GoRouter _router = createRouterConfig();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp.router(
      routerConfig: _router,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: _applicationConfig.backgroundColor,
      ),
    );
  }
}
