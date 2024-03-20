import 'package:book_n_sit/utils/app_layout.dart';
import 'package:book_n_sit/utils/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AppColumnLayout extends StatelessWidget {
  final String firstText;
  final String secondText;
  final CrossAxisAlignment alignment;
  final bool? isColor;
  final bool? isFromTicketPage;
  const AppColumnLayout({super.key, required this.firstText, required this.secondText, required this.alignment, this.isColor, this.isFromTicketPage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: alignment,
      children: [
        Text(firstText, style: Styles.headLineStyle3.copyWith(color: isColor == null ? Colors.black : isFromTicketPage == null ? Colors.white : Colors.black),),
        Gap(AppLayout.getHeight(3)),
        Text(secondText, style: isColor == null ? Styles.headLineStyle4 : isFromTicketPage == null ? Styles.headLineStyle4.copyWith(color: Colors.white) : Styles.headLineStyle4,),
      ],
    );
  }
}
