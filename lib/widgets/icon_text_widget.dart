import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../utils/app_layout.dart';
import '../utils/app_styles.dart';

class IconTextWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final controller;
  const IconTextWidget({super.key, required this.icon, required this.text, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(12), horizontal: AppLayout.getHeight(12)),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppLayout.getWidth(10))
      ),
      child: Row(
          children: [
            Icon(icon, color: const Color(0xFFBFC2DF),),
            Gap(AppLayout.getWidth(10)),
            Expanded(
              child: SizedBox(
                height: AppLayout.getHeight(40),
                child: TextField(
                  controller: controller,
                  style: Styles.textStyle,
                  decoration: InputDecoration(
                    hintText: text,
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}
