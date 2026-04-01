import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:web_dynamic_list/custom_header_resizable_handler.dart';
import 'package:web_dynamic_list/enums.dart';

class CustomHeaderCellItem extends StatefulWidget {
  final Function(double delta, String id, double currentWidth)? onDragUpdate;
  final Function(bool isHovering, double currentWidth)? onHoverChange;
  final Function(String id, ColumnSortState sortState)? onSortTap;
  final String id;
  final bool isResizable;
  final ColumnSortState sortState;
  final String title;

  const CustomHeaderCellItem({
    super.key,
    required this.id,
    required this.title,
    this.onDragUpdate,
    this.onHoverChange,
    this.isResizable = true,
    this.sortState = ColumnSortState.none,
    this.onSortTap,
  });

  @override
  State<CustomHeaderCellItem> createState() => _CustomHeaderCellItemState();
}

class _CustomHeaderCellItemState extends State<CustomHeaderCellItem> {
  bool _isDragging = false;
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: widget.isResizable
          ? (event) {
              widget.onHoverChange?.call(true, context.size?.width ?? 0);
              setState(() {
                _isHovering = true;
              });
            }
          : null,
      onExit: widget.isResizable
          ? (event) {
              if (!_isDragging) {
                widget.onHoverChange?.call(false, context.size?.width ?? 0);
                setState(() {
                  _isHovering = false;
                });
              }
            }
          : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  widget.onSortTap?.call(
                    widget.id,
                    widget.sortState == ColumnSortState.ascending ? ColumnSortState.descending : ColumnSortState.ascending,
                  );
                },
                child: Text(widget.title, maxLines: 1, overflow: TextOverflow.ellipsis),
              ),
              if (widget.sortState == ColumnSortState.ascending) Icon(Symbols.arrow_upward_alt),
              if (widget.sortState == ColumnSortState.descending) Icon(Symbols.arrow_downward_alt),
            ],
          ),
          GestureDetector(
            onHorizontalDragStart: widget.isResizable
                ? (details) {
                    _isDragging = true;
                  }
                : null,
            onHorizontalDragUpdate: widget.isResizable
                ? (details) {
                    widget.onDragUpdate?.call(details.delta.dx, widget.id, context.size?.width ?? 0);
                  }
                : null,
            onHorizontalDragEnd: widget.isResizable
                ? (details) {
                    setState(() {
                      _isDragging = false;
                      _isHovering = false;
                    });
                  }
                : null,

            child: widget.isResizable && _isHovering ? CustomHeaderResizableHandler() : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
