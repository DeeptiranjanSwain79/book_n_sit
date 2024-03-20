import 'package:book_n_sit/utils/app_layout.dart';
import 'package:book_n_sit/utils/app_styles.dart';
import 'package:book_n_sit/widgets/double_text_widget.dart';
import 'package:book_n_sit/widgets/icon_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HotelsView extends StatefulWidget {
  const HotelsView({super.key});

  @override
  State<HotelsView> createState() => _HotelsViewState();
}

class _HotelsViewState extends State<HotelsView> {
  final _textController = TextEditingController();
  String _errorMessage = "";

  _findHotelHandler() {
    final searchText = _textController.text;

    if (searchText.trim().isEmpty) {
      setState(() {
        _errorMessage = "Hotel can't be empty";
      });
    } else {
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
        IconTextWidget(icon: Icons.hotel_class_outlined, text: 'Find hotels', controller: _textController),
        Gap(AppLayout.getHeight(15)),
        Text(_errorMessage, style: Styles.textStyle.copyWith(color: Colors.red),),
        GestureDetector(
          onTap: _findHotelHandler,
          child: Container(
            width: AppLayout.getWidth(125),
            padding: EdgeInsets.symmetric(vertical: AppLayout.getHeight(12), horizontal: AppLayout.getWidth(20)),
            decoration: BoxDecoration(
              color: Colors.blue.shade900,
              borderRadius: BorderRadius.circular(AppLayout.getWidth(10)),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Find Hotels', style: Styles.textStyle.copyWith(color: Colors.white),),
              ],
            ),
          ),
        ),
        Gap(AppLayout.getHeight(20)),
        const DoubleTextWidget(firstText: "Most loved hotels"),
        Gap(AppLayout.getHeight(20)),
        SizedBox(
          height: AppLayout.getHeight(400),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  _buildHotelContainer(size, "assets/images/hotel1.jpg", "Bhubaneswar"),
                  _buildHotelContainer(size, "assets/images/hotel2.jpg", "Chennai"),
                ],
              ),
              Column(
                children: [
                  _buildHotelContainer(size, "assets/images/hotel3.jpg", "New Delhi"),
                  _buildHotelContainer(size, "assets/images/hotel4.jpg", "Mumbai"),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildHotelContainer(Size size, String imagePath, String hotelName) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: AppLayout.getHeight(180),
              width: size.width * 0.42,
              child: Opacity(
                opacity: 0.7, // Adjust opacity as needed
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppLayout.getHeight(12)),
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  hotelName,
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        Gap(AppLayout.getHeight(20)),
      ],
    );
  }
}

