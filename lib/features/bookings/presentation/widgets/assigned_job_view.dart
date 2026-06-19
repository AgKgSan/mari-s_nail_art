import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/features/bookings/presentation/pages/booking_card.dart';

class AssignedJobView extends StatefulWidget {
  const AssignedJobView({super.key});

  @override
  State<AssignedJobView> createState() => _AssignedJobViewState();
}

class _AssignedJobViewState extends State<AssignedJobView> {
  DateTime selectedDate = DateTime.now();

  DateTime now = DateTime.now();

  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,

                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 10,
                    offset: const Offset(0, 4), // shadow below
                  ),
                ],
              ),
              child: EasyDateTimeLinePicker(
                headerOptions: const HeaderOptions(
                  headerType: HeaderType.viewOnly,
                ),
                firstDate: now,
                lastDate: DateTime(now.year, now.month, now.day + 7),
                focusedDate: _selectedDate,
                selectionMode: SelectionMode.alwaysFirst(),
                onDateChange: (date) {
                  setState(() {
                    _selectedDate = date;
                  });
                },
              ),
            ),
            SizedBox(height: 20),
            BookingCard(time: "09:00"),
            BookingCard(time: "09:00"),
            BookingCard(time: "09:00"),
            BookingCard(time: "09:00"),
            BookingCard(time: "09:00"),
          ],
        ),
      ),
    );
  }
}
