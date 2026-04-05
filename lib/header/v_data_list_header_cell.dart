import 'package:flutter/material.dart';
import 'package:web_dynamic_list/v_data_list_enums.dart';

class VDataListHeaderCell extends StatefulWidget {
  final void Function(double delta, String id, double currentWidth)? onDragUpdate;
  final void Function(String id, ColumnSortState sortState)? onSortTap;
  final void Function(String id)? onDragHandlerLongPress;
  final String id;
  final bool isResizable;
  final ColumnSortState sortState;
  final String title;
  final double? width;
  final Widget? sortIconAscending;
  final Widget? sortIconDescending;
  final Widget? resizeHandler;
  final bool showSortIconsInHeader;

  const VDataListHeaderCell({
    super.key,
    required this.id,
    required this.title,
    this.width,
    this.onDragUpdate,
    this.isResizable = true,
    this.onSortTap,
    this.sortState = ColumnSortState.none,
    this.onDragHandlerLongPress,
    this.sortIconAscending,
    this.sortIconDescending,
    this.resizeHandler,
    this.showSortIconsInHeader = true,
  }) : assert(!isResizable || resizeHandler != null, 'resizeHandler must be provided if isResizable is true'),
       assert(
         showSortIconsInHeader == false || onSortTap != null,
         'if onSortTap is provided, showSortIconsInHeader must be true to trigger onSortTap when tapping the header cell',
       );

  @override
  State<VDataListHeaderCell> createState() => _VDataListHeaderCellState();
}

class _VDataListHeaderCellState extends State<VDataListHeaderCell> {
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
                    onTap: widget.onSortTap != null && widget.showSortIconsInHeader
                        ? () {
                            widget.onSortTap?.call(
                              widget.id,
                              widget.sortState == ColumnSortState.ascending
                                  ? ColumnSortState.descending
                                  : ColumnSortState.ascending,
                            );
                          }
                        : null,
                    child: Text(
                      widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  if (widget.showSortIconsInHeader &&
                      widget.sortState == ColumnSortState.ascending &&
                      widget.sortIconAscending != null)
                    widget.sortIconAscending!,
                  if (widget.showSortIconsInHeader &&
                      widget.sortState == ColumnSortState.descending &&
                      widget.sortIconDescending != null)
                    widget.sortIconDescending!,
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
                child: widget.isResizable && _isHovering ? widget.resizeHandler : SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
