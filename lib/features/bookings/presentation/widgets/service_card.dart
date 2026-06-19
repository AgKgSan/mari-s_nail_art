import 'package:flutter/material.dart';
import 'package:mari_nail_art/core/widgets/elevated_buttons.dart';

class ServicesCard extends StatelessWidget {
  final String serviceName;
  final String customerName;
  final String time;
  final String status;
  final VoidCallback? onCompleted;

  const ServicesCard({
    super.key,
    required this.serviceName,
    required this.customerName,
    required this.time,
    required this.status,
    this.onCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: Colors.orange, width: 1)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Text(
                status,
                style: TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Gel Colour",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Customer Name : ", style: const TextStyle(fontSize: 16)),
                Text(customerName),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Time : ", style: const TextStyle(fontSize: 16)),
                Text(time),
              ],
            ),

            const SizedBox(height: 16),

            ElevatedButtons(label: "Completed", onPressed: () {}),
            const SizedBox(height: 8),
            const Text("You can click if your service is completed"),
          ],
        ),
      ),
    );
  }
}
