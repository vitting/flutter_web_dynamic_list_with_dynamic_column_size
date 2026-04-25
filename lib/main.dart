import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:v_data_list/screens/reset_width_dialog_example.dart';
import 'package:v_data_list/screens/home_screen.dart';
import 'package:v_data_list/screens/lazy_load_example.dart';
import 'package:v_data_list/screens/misc_example.dart';
import 'package:v_data_list/screens/pagination_example.dart';
import 'package:v_data_list/screens/resizable_columns_example.dart';
import 'package:v_data_list/screens/dynamic_example.dart';
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
        '/': (context) => const HomeScreen(),
        DynamicExample.routeName: (context) => const DynamicExample(),
        LazyLoadExample.routeName: (context) => const LazyLoadExample(),
        PaginationExample.routeName: (context) => const PaginationExample(),
        ResizableColumnsExample.routeName: (context) => const ResizableColumnsExample(),
        MiscExample.routeName: (context) => const MiscExample(),
        ResetWidthDialogExample.routeName: (context) => const ResetWidthDialogExample(),
      },
    );
  }
}
