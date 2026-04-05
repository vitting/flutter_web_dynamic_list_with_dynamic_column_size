import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:v_data_list/row/v_data_list_row_cell.dart';
import 'package:v_data_list/theme/v_data_list_theme.dart';
import 'package:v_data_list/v_data_list_type_definitions.dart';

class VDataListRow extends StatefulWidget {
  final Function(VDataListDataRow data)? onRowTap;
  final void Function(String id, String value, VDataListDataRow data, ColumnDefinitionMap updatedColumnDefs)? onLongPress;
  final void Function(String id, String value, VDataListDataRow data, ColumnDefinitionMap updatedColumnDefs)? onLongPressCopy;
  final ColumnDefinitionMap columnDefs;
  final VDataListDataRow data;
  final bool isEven;
  final bool longPressToCopyCellValueToClipboard;
  final EdgeInsetsGeometry? rowPadding;
  final double rowSpacing;
  final bool showEvenBackgroundColor;
  final bool showHoverBackgroundColor;
  final bool showTooltip;
  final BorderRadiusGeometry? borderRadius;
  final bool showRowClickHandler;
  final Widget? rowClickHandlerIcon;
  final double rowClickHandlerWidth;
  final bool triggerOnRowTapWhenRowClickHandlerIsShown;
  final BorderRadiusGeometry? tooltipBorderRadius;

  const VDataListRow({
    super.key,
    required this.columnDefs,
    required this.data,
    this.isEven = false,
    this.onRowTap,
    this.showTooltip = false,
    this.longPressToCopyCellValueToClipboard = true,
    this.rowSpacing = 5,
    this.rowPadding,
    this.showEvenBackgroundColor = true,
    this.showHoverBackgroundColor = true,
    this.onLongPress,
    this.borderRadius,
    this.showRowClickHandler = false,
    this.rowClickHandlerIcon,
    this.rowClickHandlerWidth = 45,
    this.triggerOnRowTapWhenRowClickHandlerIsShown = false,
    this.tooltipBorderRadius,
    this.onLongPressCopy,
  });

  @override
  State<VDataListRow> createState() => _VDataListRowState();
}

class _VDataListRowState extends State<VDataListRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = VDataListTheme.of(context).rowTheme;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: widget.showRowClickHandler && !widget.triggerOnRowTapWhenRowClickHandlerIsShown
            ? null
            : () {
                widget.onRowTap?.call(widget.data);
              },
        child: Container(
          decoration: BoxDecoration(
            color: widget.showHoverBackgroundColor && _isHovered
                ? theme.hoverBackgroundColor
                : widget.showEvenBackgroundColor && widget.isEven
                ? theme.evenBackgroundColor
                : theme.backgroundColor,
            borderRadius: widget.borderRadius,
          ),
          padding: widget.rowPadding,
          margin: EdgeInsets.only(bottom: widget.rowSpacing),
          child: Row(
            children: [
              ...widget.columnDefs.entries.map((entry) {
                final columnDef = entry.value;
                return VDataListRowCell(
                  id: columnDef.id,
                  value: widget.data[columnDef.id] ?? '',
                  width: columnDef.width,
                  showTooltip: widget.showTooltip,
                  tooltipBorderRadius: widget.tooltipBorderRadius,
                  icon: columnDef.rowCellIcon,
                  iconPlacement: columnDef.rowCellIconPlacement,
                  iconSpacing: columnDef.rowCellIconSpacing,
                  columnSpacing: columnDef.columnSpacing,
                  onLongPressCell: (value) async {
                    if (widget.longPressToCopyCellValueToClipboard) {
                      await Clipboard.setData(ClipboardData(text: value));
                      widget.onLongPressCopy?.call(columnDef.id, value, widget.data, widget.columnDefs);
                    }

                    widget.onLongPress?.call(columnDef.id, value, widget.data, widget.columnDefs);
                  },
                );
              }),
              if (widget.showRowClickHandler && widget.rowClickHandlerIcon != null)
                VDataListRowCell(
                  id: '_trigger_cell_vlist_2000',
                  value: '',
                  width: widget.rowClickHandlerWidth,
                  icon: IconButton(
                    onPressed: () {
                      widget.onRowTap?.call(widget.data);
                    },
                    icon: widget.rowClickHandlerIcon!,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
