import 'package:flutter/material.dart';
import 'package:phone_shop_app/product/constant/padding_items.dart';

class ColorChange extends StatefulWidget {
  final Color color;

  const ColorChange({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  State<ColorChange> createState() => _ColorChangeState();
}

class _ColorChangeState extends State<ColorChange> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: PaddindUtility().paddingColorBtn,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              padding: const EdgeInsets.all(2),
              height: 24,
              width: 24,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                shape: BoxShape.circle,
              ),
              child: DecoratedBox(decoration: BoxDecoration(color: widget.color, shape: BoxShape.circle)),
            ),
          ),
        )
      ],
    );
  }
}
