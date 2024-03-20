import 'package:book_n_sit/utils/app_layout.dart';
import 'package:book_n_sit/utils/app_styles.dart';
import 'package:book_n_sit/widgets/double_text_widget.dart';
import 'package:book_n_sit/widgets/icon_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AirlineTicketsView extends StatefulWidget {
  AirlineTicketsView({super.key});

  @override
  State<AirlineTicketsView> createState() => _AirlineTicketsViewState();
}

class _AirlineTicketsViewState extends State<AirlineTicketsView> {
  final _departureTextController = TextEditingController();
  final _arrivalTextController = TextEditingController();
  String _errorMessage = "";

  _findTicketsHandler () {
    final departure = _departureTextController.text;
    final arrival = _arrivalTextController.text;
    if (departure.trim().isEmpty) {
      setState(() {
        _errorMessage = "Departure Can't be empty";
      });
    }
    if (arrival.trim().isEmpty) {
      setState(() {
        _errorMessage = "Arrival can't be empty";
      });
    }
    if (arrival.trim().isNotEmpty && arrival.trim().isNotEmpty){
      setState(() {
        _errorMessage = "Work in Progress";
      });
    }
    _resetErrorMessageAfterDelay();
  }

  void _resetErrorMessageAfterDelay() {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _errorMessage = "";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
  final size = AppLayout.getSize(context);
    return Column(
        children: [
          IconTextWidget(icon: Icons.flight_takeoff_rounded, text: 'Departure', controller: _departureTextController),
          Gap(AppLayout.getHeight(15)),
          IconTextWidget(icon: Icons.flight_land_rounded, text: 'Arrival', controller: _arrivalTextController),
          Gap(AppLayout.getHeight(15)),
          Text(_errorMessage, style: Styles.textStyle.copyWith(color: Colors.red),),
          GestureDetector(
            onTap: _findTicketsHandler,
            child: Container(
              width: AppLayout.getWidth(130),
              padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(12), horizontal: AppLayout.getWidth(20)),
              decoration: BoxDecoration(
                  color: Colors.blue.shade900,
                  borderRadius: BorderRadius.circular(AppLayout.getWidth(10)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Find Tickets', style: Styles.textStyle.copyWith(color: Colors.white),),
                ],
              ),
            ),
          ),
          Gap(AppLayout.getHeight(35)),
          const DoubleTextWidget(firstText: "Upcoming Flights"),
          Gap(AppLayout.getHeight(15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: AppLayout.getHeight(400),
                width: size.width * 0.42,
                padding: EdgeInsets.symmetric(horizontal: AppLayout.getHeight(15), vertical: AppLayout.getWidth(15)),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(AppLayout.getHeight(20)),
                  boxShadow: [
                    BoxShadow(color: Colors.grey.shade200, blurRadius: 1, spreadRadius: 1)
                  ]
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: AppLayout.getHeight(190),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppLayout.getHeight(12)),
                          image: const DecorationImage(
                            image: AssetImage("assets/images/sit.jpg"),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                    ),
                    Text(
                      "20% discount on the early booking of this flight, Don't miss out this chance",
                      style: Styles.headLineStyle2,
                    )
                  ],
                ),
              ),

              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: size.width*0.44,
                        height: AppLayout.getHeight(180),
                        decoration: BoxDecoration(
                            color: const Color(0xFF2AB8B8),
                            borderRadius: BorderRadius.circular(AppLayout.getHeight(18))
                        ),
                        padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(15), horizontal: AppLayout.getHeight(15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Discount\nfor survey", style: Styles.headLineStyle2.copyWith(fontWeight: FontWeight.bold, color: Colors.white),),
                            Gap(AppLayout.getHeight(10)),
                            Text("Take the survey about our services and get discount", style: Styles.headLineStyle4.copyWith(fontWeight: FontWeight.w500, color: Colors.white),),
                          ],
                        ),
                      ),
                      Positioned(
                        right: -45,
                        top: -40,
                        child: Container(
                        padding: EdgeInsets.all(AppLayout.getHeight(30)),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(width: 18, color: const Color(0xFF189999)),
                            color: Colors.transparent
                        ),
                      ),
                      ),
                    ],
                  ),
                  Gap(AppLayout.getHeight(20)),
                  Container(
                    width: size.width * 0.44,
                    height: AppLayout.getHeight(200),
                    padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(15), horizontal: AppLayout.getHeight(15)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppLayout.getHeight(18)),
                      color: const Color(0xFFEC6545)
                    ),
                    child: Column(
                      children: [
                        Text("Take love", style: Styles.headLineStyle1.copyWith(color: Colors.white, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                        Gap(AppLayout.getHeight(5)),
                        RichText(text: const TextSpan(
                          children: [
                            TextSpan(
                              text: '😍',
                              style: TextStyle(fontSize: 35)
                            ),
                            TextSpan(
                              text: '🥰',
                              style: TextStyle(fontSize: 45)
                            ),
                            TextSpan(
                              text: '😘',
                              style: TextStyle(fontSize: 35)
                            ),
                          ]
                        ))
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ]
    );
  }
}
