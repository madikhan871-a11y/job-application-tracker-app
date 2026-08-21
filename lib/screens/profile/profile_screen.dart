import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            'Profile',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 25),
          Center(
            child: Container(
              width: 85,
              height: 85,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(
                  alpha: .10,
                ),
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  'MN',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          const Center(
            child: Text(
              'Madiha',
              style: TextStyle(
                color: AppColors.textPrimary,
                fontSize: 19,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 4),
          const Center(
            child: Text(
              'Software Engineering Student',
              style: TextStyle(
                color: AppColors.textSecondary,
                fontSize: 9,
              ),
            ),
          ),
          const SizedBox(height: 30),
          _setting(
            Icons.person_outline_rounded,
            'Personal Information',
          ),
          _setting(
            Icons.notifications_none_rounded,
            'Notifications',
          ),
          _setting(
            Icons.language_rounded,
            'Language',
          ),
          _setting(
            Icons.help_outline_rounded,
            'Help & Support',
          ),
          _setting(
            Icons.info_outline_rounded,
            'About App',
          ),
        ],
      ),
    );
  }

  Widget _setting(
      IconData icon,
      String title,
      ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColors.primary,
          size: 20,
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 11,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(
          Icons.chevron_right_rounded,
          color: AppColors.textSecondary,
        ),
        onTap: () {},
      ),
    );
  }
}