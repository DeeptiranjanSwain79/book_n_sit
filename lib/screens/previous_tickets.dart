import 'package:book_n_sit/screens/ticket_view.dart';
import 'package:book_n_sit/utils/app_info_list.dart';
import 'package:book_n_sit/utils/app_layout.dart';
import 'package:flutter/cupertino.dart';

class PreviousTickets extends StatelessWidget {
  const PreviousTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ticketList.map((ticketItem) {
        return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: TicketView(ticket: ticketItem),
        );
      }).toList()
    );
  }
}
