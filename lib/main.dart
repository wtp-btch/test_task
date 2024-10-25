import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_task_company/app.dart';

void main() async {

  runApp(const ProviderScope(
    child: MyApp(),
  ),
  );
}