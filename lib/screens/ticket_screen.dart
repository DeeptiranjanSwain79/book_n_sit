import 'package:book_n_sit/screens/previous_tickets.dart';
import 'package:book_n_sit/screens/upcoming_tickets.dart';
import 'package:book_n_sit/utils/app_layout.dart';
import 'package:book_n_sit/utils/app_styles.dart';
import 'package:book_n_sit/widgets/ticket_tabs.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const UpcomingTickets(),
    const PreviousTickets()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return Scaffold(
      backgroundColor: Styles.bgColor,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(30), vertical: AppLayout.getWidth(20)),
            children: [
              Gap(AppLayout.getHeight(40)),
              Text("Tickets", style: Styles.headLineStyle1,),
              Gap(AppLayout.getHeight(20)),
              AppTicketTabs(selectedIndex: _selectedIndex, onItemTapped: _onItemTapped, firstTabText: "Upcoming", secondTabText: "Previous"),
              Gap(AppLayout.getHeight(20)),
              SizedBox(
                width: size.width * 0.85,
                child: _widgetOptions[_selectedIndex],
              ),
            ],
          ),
        ]
      ),
    );
  }
}
