import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_dynamic_list/column_definition.dart';
import 'package:web_dynamic_list/custom_list.dart';
import 'package:web_dynamic_list/custom_type_definitions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  final _scrollController = ScrollController();
  final _scrollController2 = ScrollController();
  final ColumnDefinitionMap _columnDefs = {
    'id': ColumnDefinition(id: 'id', label: 'ID', width: 100),
    'name': ColumnDefinition(id: 'name', label: 'Name', width: null),
    'email': ColumnDefinition(id: 'email', label: 'Email', width: null),
    'phone': ColumnDefinition(id: 'phone', label: 'Phone', width: null),
    'street': ColumnDefinition(id: 'street', label: 'Street', width: null),
    'city': ColumnDefinition(id: 'city', label: 'City', width: null),
    'country': ColumnDefinition(id: 'country', label: 'Country', width: null),
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      // body: Scrollbar(
      //   controller: _scrollController,
      //   notificationPredicate: (notification) => notification.depth >= 0,
      //   interactive: true,
      //   child: SingleChildScrollView(
      //     controller: _scrollController,
      //     scrollDirection: Axis.horizontal,
      //     child: SizedBox(
      //       width: 1440,

      //       child: Scrollbar(
      //         thumbVisibility: true,
      //         controller: _scrollController2,
      //         child: ScrollConfiguration(
      //           behavior: ScrollBehavior().copyWith(overscroll: false, scrollbars: false),
      //           child: CustomScrollView(
      //             controller: _scrollController2,
      //             scrollBehavior: ScrollBehavior().copyWith(overscroll: false, scrollbars: false),
      //             scrollDirection: Axis.vertical,
      //             slivers: [
      //               SliverAppBar(pinned: true, backgroundColor: Colors.orange, title: CustomHeader(useExpanded: true)),
      //               SliverList.builder(
      //                 itemCount: 150,
      //                 itemBuilder: (context, index) {
      //                   return CustomRow(useExpanded: true);
      //                 },
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
      body: CustomList(columnDefs: _columnDefs),
    );
  }
}
