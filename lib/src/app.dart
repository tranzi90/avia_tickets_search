import 'package:effective_mobile_test/ui/common/theme.dart';
import 'package:effective_mobile_test/ui/router/router.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Поиск дешевых авиабилетов',
      theme: theme,
      routerConfig: router,
      builder: (context, child) => child!,
    );
  }
}
