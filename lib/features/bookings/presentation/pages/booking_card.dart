import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/routes/app_routes.dart';

class BookingCard extends StatelessWidget {
  final String time;

  const BookingCard({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: AppColors.cardColor,

          borderRadius: BorderRadius.circular(24),

          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,

              blurRadius: 15,

              offset: Offset(0, 0),
            ),
          ],
        ),

        child: Row(
          children: [
            Container(
              width: 65,

              height: 65,

              decoration: BoxDecoration(
                color: AppColors.primary,

                borderRadius: BorderRadius.circular(18),
              ),

              child: const Icon(
                Icons.calendar_month,
                color: AppColors.background,
              ),
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    "Arrive At $time",

                    style: const TextStyle(
                      fontWeight: FontWeight.bold,

                      fontSize: 18,

                      color: AppColors.text,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "The Customer booked for Gel Colour Service.",
                    style: TextStyle(),
                  ),

                  const SizedBox(height: 8),

                  TextButton(
                    onPressed: () {
                      context.push(AppRouter.viewdetails);
                    },
                    child: Text(
                      "View Detail →",

                      style: TextStyle(
                        color: AppColors.text,

                        fontWeight: FontWeight.w500,
                      ),
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
