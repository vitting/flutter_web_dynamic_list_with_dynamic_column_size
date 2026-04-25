import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';
import 'package:v_data_list/v_data_list/type_definitions/v_data_list_type_definitions.dart';

class VDataListResetWidthDialog extends StatelessWidget {
  final VDataListConfig config;
  final VDataListResetWidthDialogBuilder? resetWidthDialogBuilder;
  const VDataListResetWidthDialog({super.key, required this.config, this.resetWidthDialogBuilder});

  static Future<bool> show(
    BuildContext context, {
    required VDataListConfig config,
    VDataListResetWidthDialogBuilder? resetWidthDialogBuilder,
  }) async {
    final result = await showDialog<bool>(
      context: context,
      builder: (context) => VDataListResetWidthDialog(config: config, resetWidthDialogBuilder: resetWidthDialogBuilder),
    );
    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final customDialog = resetWidthDialogBuilder?.call(context, config);

    final theme = VDataListTheme.of(context).resetWidthDialogTheme;
    return customDialog ??
        AlertDialog(
          backgroundColor: theme.backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: config.resetWidthDialogBorderRadius),
          contentPadding: config.resetWidthDialogContentPadding,
          titlePadding: config.resetWidthDialogTitlePadding,
          title: Text(config.resetWidthDialogTitle, style: theme.titleTextStyle),
          content: Text(config.resetWidthDialogContent, style: theme.contentTextStyle),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text(config.resetWidthDialogCancelButtonText, style: theme.confirmButtonTextStyle),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text(config.resetWidthDialogConfirmButtonText, style: theme.confirmButtonTextStyle),
            ),
          ],
        );
  }
}
