import 'package:book_n_sit/screens/ticket_view.dart';
import 'package:book_n_sit/utils/app_info_list.dart';
import 'package:book_n_sit/utils/app_layout.dart';
import 'package:book_n_sit/utils/app_styles.dart';
import 'package:book_n_sit/widgets/column_layout.dart';
import 'package:book_n_sit/widgets/layout_builder_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:barcode_widget/barcode_widget.dart';

class UpcomingTickets extends StatelessWidget {
  const UpcomingTickets({super.key});

  @override
  Widget build(BuildContext context) {
    final size = AppLayout.getSize(context);
    return SizedBox(
      child: Column(
        children: [
          Container(
                padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
                child: TicketView(ticket: ticketList[0], isColor: true, isFromTicketPage: true,),
          ),
          SizedBox(height: AppLayout.getHeight(1),),
          Container(
            width: size.width * 0.86 - AppLayout.getHeight(16) * 2,
            padding: EdgeInsets.symmetric(horizontal: AppLayout.getWidth(15), vertical: AppLayout.getHeight(20)),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppLayout.getHeight(21)),
                  bottomRight: Radius.circular(AppLayout.getHeight(21)),
              )
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnLayout(firstText: ticketList[0]['passenger'] ?? '', secondText: "Passenger", alignment: CrossAxisAlignment.start,),
                    AppColumnLayout(firstText: ticketList[0]['passport'] ?? '', secondText: "Passport", alignment: CrossAxisAlignment.end,),
                  ],
                ),
                Gap(AppLayout.getHeight(10)),
                const AppLayoutBuilderWidget(sections: 15, isColor: false,),
                Gap(AppLayout.getHeight(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppColumnLayout(firstText: ticketList[0]['e_ticket'] ?? '', secondText: "E-ticket", alignment: CrossAxisAlignment.start,),
                    AppColumnLayout(firstText: ticketList[0]['booking_code'] ?? '', secondText: "Booking Code", alignment: CrossAxisAlignment.end,),
                  ],
                ),
                Gap(AppLayout.getHeight(10)),
                const AppLayoutBuilderWidget(sections: 15, isColor: false,),
                Gap(AppLayout.getHeight(10)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/images/visa.png", scale: 11,),
                            Text('*** ${ticketList[0]['payment_method']}', style: Styles.headLineStyle3.copyWith(color: Colors.black),)
                          ],
                        ),
                        Gap(AppLayout.getWidth(5)),
                        Text("Payment method", style: Styles.headLineStyle4,),
                        
                      ],
                    ),
                    AppColumnLayout(firstText: ticketList[0]['price'], secondText: "Price", alignment: CrossAxisAlignment.end)
                  ],
                ),
                Gap(AppLayout.getHeight(10)),
                SizedBox(height: AppLayout.getHeight(1),),
                Gap(AppLayout.getHeight(20)),
              //     bar code
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(15)),
                  child: BarcodeWidget(
                    data: 'https://github.com/DeeptiranjanSwain79',
                    barcode: Barcode.code128(),
                    drawText: false,
                    color: Styles.textColor,
                    width: double.infinity,
                    height: 70,

                  ),
                ),
              ],
            ),
          ),
          Gap(AppLayout.getHeight(20)),
          Container(
            padding: EdgeInsets.only(left: AppLayout.getHeight(15)),
            child: TicketView(ticket: ticketList[1],),
          ),
        ],
      ),
    );
  }
}
