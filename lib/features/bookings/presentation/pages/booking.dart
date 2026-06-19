import 'dart:developer';

import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:horizontal_weekly_calendar/weekly_calendar.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';
import 'package:mari_nail_art/features/bookings/presentation/widgets/assigned_job_view.dart';
import 'package:mari_nail_art/features/bookings/presentation/widgets/completed_view.dart';
import 'package:mari_nail_art/features/bookings/presentation/widgets/header_view.dart';
import 'package:mari_nail_art/features/bookings/presentation/widgets/inprogress_view.dart';
import 'package:mari_nail_art/routes/app_routes.dart';
import 'package:phosphoricons_flutter/phosphoricons_flutter.dart';

class Booking extends StatefulWidget {
  const Booking({super.key});

  @override
  State<Booking> createState() => _BookingState();
}

class _BookingState extends State<Booking> with SingleTickerProviderStateMixin {
  late TabController controller;

  DateTime selectedDate = DateTime.now();
  DateTime now = DateTime.now();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: () {
          context.push(AppRouter.walkinform);
        },
        backgroundColor: AppColors.background,
        label: const Row(
          children: [
            Text("Walk In Form"),
            SizedBox(width: 10),
            Icon(PhosphorIcons.plusCircleFill),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            // header
            HeaderView(
              style1: AppFonts.body2,
              style2: AppFonts.text2,
              bgcolor: AppColors.headerBG,
              profile: AssetImage("assets/icons/UserCircle.png"),
              nameAndGreeting: 'Good Morning',
              nameAndPhone: 'Mg Mg',
            ),

            // tab bar
            TabBar(
              controller: controller,
              indicatorColor: AppColors.primary,
              labelColor: AppColors.secondary,
              unselectedLabelColor: AppColors.activeColor,
              tabs: const [
                Tab(text: "Assigned Job"),
                Tab(text: "In progress"),
                Tab(text: "Completed"),
              ],
            ),

            // body
            Expanded(
              child: Column(
                children: [
                  // WEEKLY CALENDAR
                  // EasyDateTimeLinePicker(
                  //   headerOptions: HeaderOptions(
                  //     headerType: HeaderType.viewOnly,
                  //   ),
                  //   firstDate: now,
                  //   lastDate: DateTime(now.year, now.month, now.day + 7),
                  //   focusedDate: _selectedDate,
                  //   onDateChange: (date) {
                  //     setState(() {
                  //       _selectedDate = date;
                  //     });
                  //   },
                  // ),
                  const SizedBox(height: 10),

                  // tab bar view
                  Expanded(
                    child: TabBarView(
                      controller: controller,
                      children: [
                        // Text("Assigned Job"),
                        AssignedJobView(),

                        InprogressView(),
                        CompletedView(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
