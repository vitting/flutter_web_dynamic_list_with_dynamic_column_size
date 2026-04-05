import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class CustomResizableHandler extends StatelessWidget {
  const CustomResizableHandler({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.shade300),
      child: Icon(Symbols.arrows_outward, size: 12),
    );
  }
}
