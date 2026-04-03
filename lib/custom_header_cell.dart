import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:web_dynamic_list/custom_header_resizable_handler.dart';
import 'package:web_dynamic_list/enums.dart';

class CustomHeaderCell extends StatefulWidget {
  final void Function(double, String, double)? onDragUpdate;
  final void Function(String id, ColumnSortState sortState)? onSortTap;
  final void Function(String id)? onDragHandlerLongPress;
  final String id;
  final bool isResizable;
  final ColumnSortState sortState;
  final String title;
  final double? width;

  const CustomHeaderCell({
    super.key,
    required this.id,
    required this.title,
    this.width,
    this.onDragUpdate,
    this.isResizable = true,
    this.onSortTap,
    this.sortState = ColumnSortState.none,
    this.onDragHandlerLongPress,
  });

  @override
  State<CustomHeaderCell> createState() => _CustomHeaderCellState();
}

class _CustomHeaderCellState extends State<CustomHeaderCell> {
  bool _isDragging = false;
  bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.width != null ? 0 : 1,
      child: SizedBox(
        width: widget.width,
        child: MouseRegion(
          onHover: widget.isResizable
              ? (event) {
                  setState(() {
                    _isHovering = true;
                  });
                }
              : null,
          onExit: widget.isResizable
              ? (event) {
                  if (!_isDragging) {
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
                  if (widget.sortState == ColumnSortState.ascending) Icon(Symbols.arrow_upward_alt, color: Colors.white),
                  if (widget.sortState == ColumnSortState.descending) Icon(Symbols.arrow_downward_alt, color: Colors.white),
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
                onLongPress: () {
                  widget.onDragHandlerLongPress?.call(widget.id);
                },
                child: widget.isResizable && _isHovering ? CustomHeaderResizableHandler() : SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
