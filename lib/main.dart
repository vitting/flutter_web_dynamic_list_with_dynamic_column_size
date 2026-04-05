import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:v_data_list/screens/screen_dynamic_height_screen.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';

void main() {
  runApp(const WebListExampleApp());
}

class WebListExampleApp extends StatelessWidget {
  const WebListExampleApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web List Example',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
        extensions: [VDataListTheme.defaultTheme],
      ),

      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
      ),
      routes: {
        '/': (context) => const ScreenDynamicHeightScreen(),
        ScreenDynamicHeightScreen.routeName: (context) => const ScreenDynamicHeightScreen(),
      },
    );
  }
}
