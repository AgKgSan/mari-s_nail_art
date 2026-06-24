import 'package:flutter/material.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/features/notifications/presentation/widgets/noti_card.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: const [
            Icon(Icons.notifications_none, color: Colors.black),
            SizedBox(width: 12),
            Text(
              'Notification',
              style: TextStyle(
                color: AppColors.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        children: [
          NotiCard(
            icon: Icons.calendar_today_outlined,
            title: 'New Job Assigned!',
            description:
                'Admin assigned you a new Gel Colour service for Customer Aye Aye at 09:00 AM.',
            timeAgo: 'Today, 5 Sec Ago',
          ),
          NotiCard(
            icon: Icons.block_outlined,
            title: 'Booking Cancel!',
            description: 'Customer, Su Myat Cancelled the booking.',
            timeAgo: 'Yesterday',
            isCancelled: true,
          ),
          NotiCard(
            icon: Icons.star_border_purple500_outlined,
            title: 'Customer Review',
            description: 'You Got 5 stars For your Service.',
            timeAgo: 'Yesterday',
          ),
          NotiCard(
            icon: Icons.campaign_outlined,
            title: 'New Staff Announcement!',
            description:
                'we would like to warmly welcome La Min, who will be taking on the role of Nail Artist at our shop starting today.',
            timeAgo: '1 Month Ago',

            imageUrl:
                'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=600',
          ),
        ],
      ),
    );
  }
}
