import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class CustomHeaderCellItem extends StatefulWidget {
  final String id;
  final String title;

  final Function(double delta, String id, double currentWidth)? onDragUpdate;
  final Function(bool isHovering, double currentWidth)? onHoverChange;
  const CustomHeaderCellItem({super.key, required this.id, required this.title, this.onDragUpdate, this.onHoverChange});

  @override
  State<CustomHeaderCellItem> createState() => _CustomHeaderCellItemState();
}

class _CustomHeaderCellItemState extends State<CustomHeaderCellItem> {
  bool _isHovering = false;
  bool _isDragging = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (event) {
        widget.onHoverChange?.call(true, context.size?.width ?? 0);
        setState(() {
          _isHovering = true;
        });
      },
      onExit: (event) {
        if (!_isDragging) {
          widget.onHoverChange?.call(false, context.size?.width ?? 0);
          setState(() {
            _isHovering = false;
          });
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(widget.title, maxLines: 1, overflow: TextOverflow.ellipsis),
          GestureDetector(
            onHorizontalDragStart: (details) {
              _isDragging = true;
            },
            onHorizontalDragUpdate: (details) {
              widget.onDragUpdate?.call(details.delta.dx, widget.id, context.size?.width ?? 0);
            },
            onHorizontalDragEnd: (details) {
              setState(() {
                _isDragging = false;
                _isHovering = false;
              });
            },

            child: _isHovering ? Icon(Symbols.arrows_outward) : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
