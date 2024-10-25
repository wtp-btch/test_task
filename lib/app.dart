import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_company/core/presentation/screens/routing/app_routing.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Company List',
      routerConfig: router,
    );
  }
}