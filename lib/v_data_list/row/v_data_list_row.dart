import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:v_data_list/v_data_list/config/v_data_list_config.dart';
import 'package:v_data_list/v_data_list/enums/v_data_list_enums.dart';
import 'package:v_data_list/v_data_list/row/v_data_list_row_cell.dart';
import 'package:v_data_list/v_data_list/row/models/v_data_list_row_cell_data.dart';
import 'package:v_data_list/v_data_list/row/models/v_data_list_row_cell_style.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';
import 'package:v_data_list/v_data_list/type_definitions/v_data_list_type_definitions.dart';

class VDataListRow extends StatefulWidget {
  final Function(VDataListDataRow data)? onRowTap;
  final void Function(String id, String value, VDataListDataRow data, ColumnDefinitionMap updatedColumnDefs)? onLongPress;
  final void Function(String id, String value, VDataListDataRow data, ColumnDefinitionMap updatedColumnDefs)? onLongPressCopy;
  final VDataListRowCellStyle? Function(BuildContext context, String id, VDataListRowCellData cellData)? rowCellStyleBuilder;
  final ColumnDefinitionMap columnDefs;
  final VDataListDataRow data;
  final VDataListConfig config;
  final bool isEven;

  const VDataListRow({
    super.key,
    required this.columnDefs,
    required this.data,
    required this.config,
    this.isEven = false,
    this.onRowTap,
    this.onLongPress,
    this.onLongPressCopy,
    this.rowCellStyleBuilder,
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
      cursor: widget.config.showRowClickHandler && !widget.config.triggerOnRowTapWhenRowClickHandlerIsShown
          ? MouseCursor.defer
          : SystemMouseCursors.click,
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
        onTap: widget.config.showRowClickHandler && !widget.config.triggerOnRowTapWhenRowClickHandlerIsShown
            ? null
            : () {
                widget.onRowTap?.call(widget.data);
              },
        child: Container(
          decoration: BoxDecoration(
            color: widget.config.showRowHoverColor && _isHovered
                ? theme.hoverBackgroundColor
                : widget.config.showRowEvenBackgroundColor && widget.isEven
                ? theme.evenBackgroundColor
                : theme.backgroundColor,
            borderRadius: widget.config.rowBorderRadius,
          ),
          padding: widget.config.rowPadding,
          margin: EdgeInsets.only(bottom: widget.config.rowSpacing),
          child: Row(
            children: [
              ...widget.columnDefs.entries.map((entry) {
                final columnDef = entry.value;
                final data = widget.data[columnDef.id] ?? VDataListRowCellData(value: '');
                final cellStyle = widget.rowCellStyleBuilder?.call(context, columnDef.id, data);
                return VDataListRowCell(
                  id: columnDef.id,
                  data: data,
                  width: columnDef.width,
                  icon: columnDef.rowCellIcon,
                  iconPlacement: columnDef.rowCellIconPlacement,
                  iconSpacing: columnDef.rowCellIconSpacing,
                  columnSpacing: columnDef.columnSpacing,
                  config: widget.config,
                  cellStyle: cellStyle,
                  onLongPressCell: (value) async {
                    if (widget.config.longPressToCopyCellValueToClipboard) {
                      await Clipboard.setData(ClipboardData(text: value));
                      widget.onLongPressCopy?.call(columnDef.id, value, widget.data, widget.columnDefs);
                    }

                    widget.onLongPress?.call(columnDef.id, value, widget.data, widget.columnDefs);
                  },
                );
              }),
              if (widget.config.showRowClickHandler)
                VDataListRowCell(
                  id: '_trigger_cell_vlist_2000',
                  data: VDataListRowCellData(value: ''),
                  config: widget.config,
                  width: widget.config.rowClickHandlerWidth,
                  iconPlacement: RowCellIconPlacement.right,
                  icon: IconButton(
                    onPressed: () {
                      widget.onRowTap?.call(widget.data);
                    },
                    icon: widget.config.rowClickHandlerIcon,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
