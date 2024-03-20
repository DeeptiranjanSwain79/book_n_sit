import 'package:book_n_sit/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppLayoutBuilderWidget extends StatelessWidget {
  final bool? isColor;
  final int sections;
  const AppLayoutBuilderWidget({super.key, this.isColor, required this.sections});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
      return Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: List.generate((constraints.constrainWidth()/sections).floor(),
                (index) => Text("-", style: Styles.headLineStyle4.copyWith(color: isColor == null ? Colors.white : Colors.grey.shade400))
        )
      );
      },
    );
  }
}
