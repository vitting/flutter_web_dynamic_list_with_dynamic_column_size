import 'package:flutter/material.dart';
import 'package:v_data_list/v_data_list/theme/v_data_list_theme.dart';

class VDataListPaginationItem extends StatefulWidget {
  final int index;
  final int currentSelectedIndex;
  final void Function(int index) onTap;
  const VDataListPaginationItem({super.key, required this.index, required this.currentSelectedIndex, required this.onTap});

  @override
  State<VDataListPaginationItem> createState() => _VDataListPaginationItemState();
}

class _VDataListPaginationItemState extends State<VDataListPaginationItem> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    final theme = VDataListTheme.of(context).paginationTheme;
    return GestureDetector(
      onTap: () => widget.onTap(widget.index),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onHover: (event) {
          setState(() {
            _isHovering = true;
          });
        },
        onExit: (event) {
          setState(() {
            _isHovering = false;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: _isHovering
                ? theme.hoverBackgroundColor
                : widget.currentSelectedIndex == widget.index
                ? theme.selectedItemBackgroundColor
                : theme.itemBackgroundColor,
            shape: BoxShape.circle,
          ),
          child: Text(
            '${widget.index + 1}',
            style: widget.currentSelectedIndex == widget.index
                ? _isHovering
                      ? theme.hoverSelectedTextStyle
                      : theme.selectedTextStyle
                : _isHovering
                ? theme.hoverTextStyle
                : theme.textStyle,
          ),
        ),
      ),
    );
  }
}
