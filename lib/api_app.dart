import 'package:flutter/material.dart';

import 'app/dependencies/dependency_factory.dart';
import 'app/dependencies/dependency_provider.dart';
import 'app/routes/routes.dart';

class ApiApp extends StatefulWidget {
  @override
  _ApiAppState createState() => _ApiAppState();
}

class _ApiAppState extends State<ApiApp> {
  @override
  Widget build(BuildContext context) {
    return DependencyProvider(
      dependencyFactory: DependencyFactory(),
      child: Builder(
        builder: (context) => MaterialApp(
          themeMode: ThemeMode.system,
          title: 'Todo',
          onGenerateRoute: (settings) =>
              Routes.onGenerateRoute(settings, context),
        ),
      ),
    );
  }
}
