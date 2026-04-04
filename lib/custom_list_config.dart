import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

import 'package:web_dynamic_list/custom_resizable_handler.dart';
import 'package:web_dynamic_list/enums.dart';

class CustomListConfig {
  /// The border radius for the header row.
  final double borderRadiusHeader;

  /// The border radius for the data rows.
  final double borderRadiusRow;

  /// The border radius for the total count display.
  final double borderRadiusTotalCount;

  /// Whether long pressing a column resize handler should reset the column width dynamic width.
  final bool canResetColumnWidthOnLongPress;

  /// An optional message to show when a cell value is copied to the clipboard.
  /// If null, no message will be shown.
  final String? copyCellValueToClipboardMessage;

  /// The spacing between the header and the first row.
  final double headerBottomSpacing;

  /// The height of the header row.
  /// This is used to calculate the height of the list and when pinning the header.
  final double headerHeight;

  /// Whether long pressing a cell should copy its value to the clipboard.
  /// If true, long pressing a cell will copy its value to the clipboard and
  /// show a snackbar with the [copyCellValueToClipboardMessage] if not null.
  final bool longPressToCopyCellValueToClipboard;

  /// An optional message to show when there is no data to display in the list.
  /// If null, no message will be shown when the list is empty.
  final String? noDataMessage;

  /// Whether the header should be pinned to the top of the list when scrolling.
  /// If true, the header will remain visible at the top of the list when scrolling.
  final bool pinHeader;

  /// The widget to use as the resize handler for resizable columns.
  /// This widget will be displayed at the edge of resizable column headers and can be dragged to resize the column.
  final Widget resizeHandler;

  /// The icon to show in the row click handler when [showRowClickHandler] is true.
  final Widget rowClickHandlerIcon;

  /// The width of the row click handler when [showRowClickHandler] is true.
  final double rowClickHandlerWidth;

  /// The padding for each row in the list.
  final EdgeInsetsGeometry rowPadding;

  /// The spacing between rows in the list.
  /// This is used to create visual separation between rows.
  final double rowSpacing;

  /// Whether to show a row click handler in each row at the end of the row.
  /// If true, a click handler will be shown in each row that can be tapped to trigger the [onRowTap] callback for that row.
  /// If [triggerOnRowTapWhenRowClickHandlerIsShown] is true, tapping the row click handler will also trigger the [onRowTap] callback for the row.
  final bool showRowClickHandler;

  /// Whether to show a tooltip with the full cell value when hovering over a cell.
  final bool showTooltip;

  /// The icon to show in the column header when the column is sorted in ascending order.
  /// This is used to provide a visual indication of the sort state of the column.
  final Widget sortIconAscending;

  /// The icon to show in the column header when the column is sorted in descending order.
  /// This is used to provide a visual indication of the sort state of the column.
  final Widget sortIconDescending;

  /// Whether the text in the cells should be selectable.
  /// If true, the text in the cells can be selected and copied by the user.
  final bool textIsSelectable;

  /// The position to show the total items count when [totalItems] is provided.
  /// This is used to determine where to display the total count of items in the list when [totalItems] is not null.
  final CustomListTotalCountPosition totalItemsPosition;

  /// Whether tapping the row should trigger the [onRowTap] callback even if [showRowClickHandler] is true.
  final bool triggerOnRowTapWhenRowClickHandlerIsShown;

  CustomListConfig({
    this.copyCellValueToClipboardMessage = "Copied to clipboard",
    this.headerBottomSpacing = 4,
    this.headerHeight = 40,
    this.longPressToCopyCellValueToClipboard = true,
    this.pinHeader = true,
    this.rowPadding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    this.rowSpacing = 5,
    this.showTooltip = true,
    this.textIsSelectable = false,
    this.totalItemsPosition = CustomListTotalCountPosition.top,
    this.canResetColumnWidthOnLongPress = true,
    this.sortIconAscending = const Icon(Symbols.arrow_upward_alt, color: Colors.white),
    this.sortIconDescending = const Icon(Symbols.arrow_downward_alt, color: Colors.white),
    this.resizeHandler = const CustomResizableHandler(),
    this.noDataMessage = "No data available",
    this.borderRadiusHeader = 8,
    this.borderRadiusRow = 8,
    this.borderRadiusTotalCount = 8,
    this.showRowClickHandler = false,
    this.rowClickHandlerIcon = const Icon(Symbols.arrow_forward_ios, size: 16),
    this.rowClickHandlerWidth = 45,
    this.triggerOnRowTapWhenRowClickHandlerIsShown = false,
  });

  CustomListConfig copyWith({
    double? borderRadiusHeader,
    double? borderRadiusRow,
    double? borderRadiusTotalCount,
    bool? canResetColumnWidthOnLongPress,
    String? copyCellValueToClipboardMessage,
    double? headerBottomSpacing,
    double? headerHeight,
    bool? longPressToCopyCellValueToClipboard,
    String? noDataMessage,
    bool? pinHeader,
    Widget? resizeHandler,
    Widget? rowClickHandlerIcon,
    double? rowClickHandlerWidth,
    EdgeInsetsGeometry? rowPadding,
    double? rowSpacing,
    bool? showRowClickHandler,
    bool? showTooltip,
    Widget? sortIconAscending,
    Widget? sortIconDescending,
    bool? textIsSelectable,
    CustomListTotalCountPosition? totalItemsPosition,
    bool? triggerOnRowTapWhenRowClickHandlerIsShown,
  }) {
    return CustomListConfig(
      borderRadiusHeader: borderRadiusHeader ?? this.borderRadiusHeader,
      borderRadiusRow: borderRadiusRow ?? this.borderRadiusRow,
      borderRadiusTotalCount: borderRadiusTotalCount ?? this.borderRadiusTotalCount,
      canResetColumnWidthOnLongPress: canResetColumnWidthOnLongPress ?? this.canResetColumnWidthOnLongPress,
      copyCellValueToClipboardMessage: copyCellValueToClipboardMessage ?? this.copyCellValueToClipboardMessage,
      headerBottomSpacing: headerBottomSpacing ?? this.headerBottomSpacing,
      headerHeight: headerHeight ?? this.headerHeight,
      longPressToCopyCellValueToClipboard: longPressToCopyCellValueToClipboard ?? this.longPressToCopyCellValueToClipboard,
      noDataMessage: noDataMessage ?? this.noDataMessage,
      pinHeader: pinHeader ?? this.pinHeader,
      resizeHandler: resizeHandler ?? this.resizeHandler,
      rowClickHandlerIcon: rowClickHandlerIcon ?? this.rowClickHandlerIcon,
      rowClickHandlerWidth: rowClickHandlerWidth ?? this.rowClickHandlerWidth,
      rowPadding: rowPadding ?? this.rowPadding,
      rowSpacing: rowSpacing ?? this.rowSpacing,
      showRowClickHandler: showRowClickHandler ?? this.showRowClickHandler,
      showTooltip: showTooltip ?? this.showTooltip,
      sortIconAscending: sortIconAscending ?? this.sortIconAscending,
      sortIconDescending: sortIconDescending ?? this.sortIconDescending,
      textIsSelectable: textIsSelectable ?? this.textIsSelectable,
      totalItemsPosition: totalItemsPosition ?? this.totalItemsPosition,
      triggerOnRowTapWhenRowClickHandlerIsShown:
          triggerOnRowTapWhenRowClickHandlerIsShown ?? this.triggerOnRowTapWhenRowClickHandlerIsShown,
    );
  }
}
