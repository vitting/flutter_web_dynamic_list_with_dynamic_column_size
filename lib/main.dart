import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_dynamic_list/custom_list.dart';
import 'package:web_dynamic_list/custom_type_definitions.dart';
import 'package:web_dynamic_list/generate_fake_data_helper.dart';

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
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Web List Example'),
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late DataRowList _data;
  @override
  void initState() {
    super.initState();
    _data = GenerateFakeDataHelper.generateData(150, columnDefsWithColumnsThatArentResizable.keys.toList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: CustomList(
        columnDefs: columnDefsWithColumnsThatArentResizable,
        data: _data,
        showTooltip: true,
        textIsSelectable: false,
      ),
    );
  }
}
