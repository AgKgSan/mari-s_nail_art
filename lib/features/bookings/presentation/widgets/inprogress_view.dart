import 'package:flutter/material.dart';
import 'package:mari_nail_art/features/bookings/presentation/widgets/service_card.dart';

class InprogressView extends StatelessWidget {
  const InprogressView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ServicesCard(
                serviceName: "Gel Colour",
                customerName: "Aye Aye",
                time: "09:00AM",
                status: "inProgress",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
