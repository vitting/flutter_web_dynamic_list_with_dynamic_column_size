import 'package:flutter/material.dart' hide DataRow;
import 'package:flutter/services.dart';
import 'package:web_dynamic_list/row/custom_row_cell.dart';
import 'package:web_dynamic_list/custom_type_definitions.dart';

class CustomRow extends StatefulWidget {
  final Function(DataRow data)? onRowTap;
  final void Function(String id, String value, DataRow data, ColumnDefinitionMap updatedColumnDefs)? onLongPress;
  final ColumnDefinitionMap columnDefs;
  final String? copyCellValueToClipboardMessage;
  final DataRow data;
  final bool isEven;
  final bool longPressToCopyCellValueToClipboard;
  final EdgeInsetsGeometry rowPadding;
  final double rowSpacing;
  final bool showEvenBackgroundColor;
  final bool showHoverBackgroundColor;
  final bool showTooltip;
  final BorderRadiusGeometry? borderRadius;
  final bool showRowClickHandler;
  final Widget? rowClickHandlerIcon;
  final double rowClickHandlerWidth;
  final bool triggerOnRowTapWhenRowClickHandlerIsShown;

  const CustomRow({
    super.key,
    required this.columnDefs,
    required this.data,
    this.isEven = false,
    this.onRowTap,
    this.showTooltip = false,
    this.longPressToCopyCellValueToClipboard = true,
    this.copyCellValueToClipboardMessage,
    this.rowSpacing = 5,
    this.rowPadding = const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
    this.showEvenBackgroundColor = true,
    this.showHoverBackgroundColor = true,
    this.onLongPress,
    this.borderRadius,
    this.showRowClickHandler = false,
    this.rowClickHandlerIcon,
    this.rowClickHandlerWidth = 45,
    this.triggerOnRowTapWhenRowClickHandlerIsShown = false,
  });

  @override
  State<CustomRow> createState() => _CustomRowState();
}

class _CustomRowState extends State<CustomRow> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
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
                ? Colors.grey.shade400
                : widget.showEvenBackgroundColor && widget.isEven
                ? Colors.grey.shade300
                : Colors.grey.shade200,
            borderRadius: widget.borderRadius,
          ),
          padding: widget.rowPadding,
          margin: EdgeInsets.only(bottom: widget.rowSpacing),
          child: Row(
            children: [
              ...widget.columnDefs.entries.map((entry) {
                final columnDef = entry.value;
                return CustomRowCell(
                  id: columnDef.id,
                  value: widget.data[columnDef.id] ?? '',
                  width: columnDef.width,
                  showTooltip: widget.showTooltip,
                  icon: columnDef.rowCellIcon,
                  iconPlacement: columnDef.rowCellIconPlacement,
                  iconSpacing: columnDef.rowCellIconSpacing,
                  columnSpacing: columnDef.columnSpacing,
                  onLongPressCell: (value) async {
                    if (widget.longPressToCopyCellValueToClipboard) {
                      await Clipboard.setData(ClipboardData(text: value));
                      if (context.mounted && widget.copyCellValueToClipboardMessage != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Center(child: Text('${widget.copyCellValueToClipboardMessage}: $value'))),
                        );
                      }
                    }

                    widget.onLongPress?.call(columnDef.id, value, widget.data, widget.columnDefs);
                  },
                );
              }),
              if (widget.showRowClickHandler && widget.rowClickHandlerIcon != null)
                CustomRowCell(
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
