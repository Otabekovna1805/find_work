import 'package:device_preview/device_preview.dart';
import 'package:find_work/app.dart';
import 'package:find_work/service/db_hive.dart';
import 'package:flutter/material.dart';

import 'core/service_locator.dart';
// HiveUser auth = HiveUser();
void main() async {
  // await HiveUser.init();
  WidgetsFlutterBinding.ensureInitialized();
  await serviceLocator();
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const MyApp(),
    ),
  );
}
