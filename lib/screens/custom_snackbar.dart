import 'package:flutter/material.dart';

class CustomSnackbar {
  static void copySnackbar(BuildContext context, String? value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        width: 250,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 1),
        backgroundColor: Colors.grey.shade900,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(Icons.copy, color: Colors.white, size: 16),
                SizedBox(width: 8),
                Text('Copied value to clipboard:'),
              ],
            ),
            SizedBox(height: 8, width: double.infinity),
            Text(value ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
