import 'package:flutter/material.dart';

import '../utils/app_styles.dart';

class DoubleTextWidget extends StatelessWidget {
  final String firstText;
  final String? secondText;
  final String? to;
  const DoubleTextWidget({super.key, required this.firstText, this.secondText, this.to});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(firstText, style: Styles.headLineStyle2,),
        InkWell(
            onTap: () {
              // ignore: avoid_print
              print(to ?? "WIP");
            },
            child: Text(secondText ?? "View all", style: Styles.textStyle.copyWith(color: Styles.primaryColor),))
      ],
    );
  }
}
