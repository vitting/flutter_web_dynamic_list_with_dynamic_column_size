import 'package:flutter/material.dart';

class CustomRowCell extends StatelessWidget {
  final String id;
  final String value;
  final double? width;

  const CustomRowCell({super.key, required this.id, required this.value, this.width});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: width != null ? 0 : 1,
      child: SizedBox(
        width: width,
        child: Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
