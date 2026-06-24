import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mari_nail_art/core/theme/app_colors.dart';
import 'package:mari_nail_art/core/theme/app_fonts.dart';
import 'package:mari_nail_art/features/profile/presentation/widgets/profile_card.dart';
import 'package:mari_nail_art/features/profile/presentation/widgets/settint_tile.dart';
import 'package:mari_nail_art/routes/app_routes.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Row(
          children: [
            const Icon(
              Icons.account_circle_outlined,
              color: AppColors.secondary,
            ),
            const SizedBox(width: 12),
            Text(
              'My Profile',
              style: AppFonts.heading2.copyWith(color: AppColors.secondary),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),

            Center(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.primary, width: 2),
                    ),
                    child: const CircleAvatar(
                      radius: 75,
                      backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&q=80&w=600',
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 6,
                    right: 6,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: AppColors.background,
                        size: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            Text(
              'Myo Myo',
              style: AppFonts.shopNamelogin.copyWith(fontSize: 32),
            ),
            const SizedBox(height: 28),

            Row(
              children: const [
                Expanded(
                  child: ProfileStatCard(
                    title: 'Ratings',
                    value: '4.9',
                    icon: Icons.star_border_rounded,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ProfileStatCard(title: 'Customers', value: '100+'),
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Divider(color: AppColors.headerBG, thickness: 1.5),
            const SizedBox(height: 16),

            Align(
              alignment: Alignment.centerLeft,
              child: Text('Settings', style: AppFonts.greeting),
            ),
            const SizedBox(height: 16),

            SettingTile(
              icon: Icons.apps_rounded,
              title: 'Change Password',
              onTap: () {
                context.push(AppRouter.changePassword);
              },
            ),
            SettingTile(
              icon: Icons.language,
              title: 'Change Language',
              onTap: () {
                context.push(AppRouter.changeLanguage);
              },
            ),
            SettingTile(
              icon: Icons.description_outlined,
              title: 'Terms & Conditions',
              onTap: () {
                context.push(AppRouter.termsandcondition);
              },
            ),
            SettingTile(
              icon: Icons.description_outlined,
              title: 'Privacy & Security',
              onTap: () {
                context.push(AppRouter.privacyandsecurity);
              },
            ),
          ],
        ),
      ),
    );
  }
}
