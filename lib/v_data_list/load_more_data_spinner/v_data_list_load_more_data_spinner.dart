import 'package:flutter/material.dart';

class VDataListLoadMoreDataSpinner extends StatelessWidget {
  const VDataListLoadMoreDataSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 60, alignment: Alignment.center, child: const CircularProgressIndicator());
  }
}
