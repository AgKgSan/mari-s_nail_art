import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';
import 'package:mari_nail_art/core/widgets/elevated_buttons.dart';
import 'package:mari_nail_art/features/bookings/presentation/widgets/header_view.dart';
import 'package:mari_nail_art/features/bookings/presentation/widgets/service.dart';

class ViewDetails extends StatelessWidget {
  const ViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text("Customer's Booking Details"),
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          HeaderView(
            style1: AppFonts.body1,
            style2: AppFonts.text2,
            bgcolor: AppColors.background,
            profile: AssetImage("assets/icons/UserCircle.png"),
            nameAndGreeting: 'Mg Mg',
            nameAndPhone: '09987654321',
          ),
          Service(shopData: "Service Name :", serviceData: "Gal Colour"),
          Service(shopData: "Date :", serviceData: "09/09/2026"),
          Service(shopData: "Time :", serviceData: "09:00AM"),
          Service(shopData: "Total :", serviceData: "35000"),
          Service(
            shopData: "Note:",
            serviceData:
                "this is a note this is a note this is a note this is a note this is a note this is a note this is a note this is a note v this is a note",
          ),
          ElevatedButtons(label: "Start Job", onPressed: () {}),
        ],
      ),
    );
  }
}
