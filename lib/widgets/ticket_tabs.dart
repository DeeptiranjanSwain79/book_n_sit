import 'package:book_n_sit/utils/app_layout.dart';
import 'package:book_n_sit/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTicketTabs extends StatefulWidget {
  final int selectedIndex;
  final void Function(int) onItemTapped;
  final String firstTabText;
  final String secondTabText;
  const AppTicketTabs({super.key, required this.selectedIndex, required this.onItemTapped, required this.firstTabText, required this.secondTabText});

  @override
  State<AppTicketTabs> createState() => _AppTicketTabsState();
}

class _AppTicketTabsState extends State<AppTicketTabs> {
  int selectedIndex = 0; // Add selectedIndex state variable

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.all(3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppLayout.getHeight(50)),
          color: const Color(0xFFA7BBFA),
        ),
        child: Row(
          children: [
            // Airline tickets
            GestureDetector(
              onTap: () => _handleItemTapped(0), // Call _handleItemTapped method
              child: Container(
                width: size.width * 0.44,
                padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7)),
                decoration: BoxDecoration(
                  borderRadius: selectedIndex == 0 ? BorderRadius.horizontal(left: Radius.circular(AppLayout.getHeight(50))) : BorderRadius.zero,
                  color: selectedIndex == 0 ? Colors.white : Colors.transparent,
                ),
                child: Center(child: Text(widget.firstTabText, style: selectedIndex == 0 ? Styles.headLineStyle3.copyWith(color: Colors.black) : Styles.headLineStyle3.copyWith(color: Colors.white),)),
              ),
            ),
            //Hotels
            GestureDetector(
              onTap: () => _handleItemTapped(1), // Call _handleItemTapped method
              child: Container(
                width: size.width * 0.44,
                padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(7)),
                decoration: BoxDecoration(
                  borderRadius: selectedIndex == 1 ? BorderRadius.horizontal(right: Radius.circular(AppLayout.getHeight(50))) : BorderRadius.zero,
                  color: selectedIndex == 1 ? Colors.white : Colors.transparent,
                ),
                child: Center(child: Text(widget.secondTabText, style: selectedIndex == 1 ? Styles.headLineStyle3.copyWith(color: Colors.black) : Styles.headLineStyle3.copyWith(color: Colors.white),)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleItemTapped(int index) {
    setState(() {
      selectedIndex = index; // Update selectedIndex
    });
    widget.onItemTapped(index); // Notify parent widget about the selected index
  }
}

