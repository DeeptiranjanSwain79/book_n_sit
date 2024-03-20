import 'package:book_n_sit/utils/app_layout.dart';
import 'package:book_n_sit/utils/app_styles.dart';
import 'package:book_n_sit/widgets/column_layout.dart';
import 'package:book_n_sit/widgets/layout_builder_widget.dart';
import 'package:book_n_sit/widgets/thick_container.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TicketView extends StatelessWidget {
  final Map<String, dynamic> ticket;
  final bool? isColor;
  final bool? isFromTicketPage;
  const TicketView({super.key, required this.ticket, this.isColor, this.isFromTicketPage});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      width: size.width * 0.85,
      height: AppLayout.getHeight(180),
      child: Container(
        margin: EdgeInsets.only(right: AppLayout.getHeight(16)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Showing blue part of ticket
            Container(
              decoration: BoxDecoration(
                  color: isColor == null ? const Color(0xFF526799) : Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(AppLayout.getHeight(21)), topRight: Radius.circular(AppLayout.getHeight(21)))
              ),
              padding: EdgeInsets.all(AppLayout.getHeight(16)),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(ticket['from']['code'], style: Styles.headLineStyle3.copyWith(color: isColor == null ? Colors.white : Colors.black),),
                      const Spacer(),
                      const ThickContainer(isColor: true,),
                      Expanded(child: Stack(
                        children: [
                          SizedBox(
                            height: AppLayout.getHeight(24),
                            child: const AppLayoutBuilderWidget(sections: 6, isColor: true,),
                          ),
                          Center(child: Transform.rotate(angle: 1.5, child: Icon(Icons.local_airport_rounded, color: isColor == null ? Colors.white : const Color(0xFF8ACCF7),),)),
                        ]
                      )),
                      const ThickContainer(isColor: true,),
                      const Spacer(),
                      Text(ticket['to']['code'], style: Styles.headLineStyle3.copyWith(color: isColor == null ? Colors.white : Colors.black),),
                    ],
                  ),
                  const Gap(2),
                  Row(
                    children: [
                      Text((ticket['from']['name']).length > 5 ? '${(ticket['from']['name'] as String).substring(0, 5)}...' : ticket['from']['name'], style: isColor == null ? Styles.headLineStyle4.copyWith(color: Colors.white) : Styles.headLineStyle4,),
                      const Spacer(),
                      Text(ticket['flying_time'], style: Styles.headLineStyle3.copyWith(color: isColor == null ? Colors.white : Colors.black),),
                      const Spacer(),
                      Text((ticket['to']['name'] as String).length > 5 ? '${(ticket['to']['name'] as String).substring(0, 5)}...' : ticket['to']['name'], style: isColor == null ? Styles.headLineStyle4.copyWith(color: Colors.white) : Styles.headLineStyle4, textAlign: TextAlign.end,),
                    ],
                  ),

                ],
              ),
            ),
            //showing orange part of card
            Container(
              color: isColor == null ? Styles.orangeColor : Colors.white,
              child: Row(
                children: [
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getWidth(10),
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(AppLayout.getHeight(10)), bottomRight: const Radius.circular(10)),
                      ),
                    ),
                  ),
                  Expanded(child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: LayoutBuilder(
                      builder: (BuildContext context, BoxConstraints constraints) {
                        return Flex(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          direction: Axis.horizontal,
                          children: List.generate((constraints.constrainWidth()/15).floor(), (index) => SizedBox(
                            width: AppLayout.getWidth(5), height: AppLayout.getHeight(1),
                            child: DecoratedBox(
                              decoration: BoxDecoration(color: isColor == null ? Colors.white : Colors.grey.shade400),
                            ),
                          )),
                        );
                      },
                    ),
                  )),
                  SizedBox(
                    height: AppLayout.getHeight(20),
                    width: AppLayout.getHeight(10),
                    child: const DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //bottom part of the orange card
            Container(
              decoration: BoxDecoration(
                  color: isColor == null ? Styles.orangeColor : Colors.white,
                  borderRadius: isColor == null ? const BorderRadius.only(bottomLeft: Radius.circular(21), bottomRight: Radius.circular(21)) : BorderRadius.zero
              ),
              padding: const EdgeInsets.only(left: 16, top: 10, right: 16, bottom: 16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColumnLayout(firstText: ticket['date'], secondText: 'Date', alignment: CrossAxisAlignment.start, isColor: true, isFromTicketPage: isFromTicketPage,),
                      AppColumnLayout(firstText: ticket['departure_time'], secondText: 'Departure time', alignment: CrossAxisAlignment.center, isColor: true, isFromTicketPage: isFromTicketPage,),
                      AppColumnLayout(firstText: ticket['ticketNumber'], secondText: 'Number', alignment: CrossAxisAlignment.end, isColor: true, isFromTicketPage: isFromTicketPage,),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
