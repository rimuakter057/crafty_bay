import 'package:flutter/material.dart';

import '../../../../../app/utils/constants/color.dart';

class IncrementDecrementCountWidget extends StatefulWidget {
  IncrementDecrementCountWidget({super.key, required this.quantity, required this.count});
  final Function(int) quantity;
  int count;


  @override
  State<IncrementDecrementCountWidget> createState() =>
      _IncrementDecrementCountWidgetState();
}

class _IncrementDecrementCountWidgetState
    extends State<IncrementDecrementCountWidget> {


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            widget.count++;
            widget.quantity( widget.count);
            setState(() {});
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.themeColor,
            ),
            child: Icon(Icons.add, color: Colors.white),
          ),
        ),
        SizedBox(width: 8),
        Text(
          '${widget.count}',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            switch (widget.count) {
              case > 1:
                widget.count--;
                widget.quantity(widget.count);
            }
            setState(() {});
          },
          child: Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color:
              widget.count < 2
                  ? AppColors.themeColor.withOpacity(0.6)
                  : AppColors.themeColor,
            ),
            child: Icon(Icons.remove, color: Colors.white),
          ),
        ),
      ],
    );
  }
}