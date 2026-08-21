import 'package:flutter/material.dart';

import '../core/constants/app_colors.dart';
import '../models/job.dart';

class StatusChip extends StatelessWidget {
  final JobStatus status;

  const StatusChip({
    super.key,
    required this.status,
  });

  String get label {
    switch (status) {
      case JobStatus.applied:
        return 'Applied';
      case JobStatus.interview:
        return 'Interview';
      case JobStatus.offer:
        return 'Offer';
      case JobStatus.rejected:
        return 'Rejected';
    }
  }

  Color get color {
    switch (status) {
      case JobStatus.applied:
        return AppColors.primary;
      case JobStatus.interview:
        return AppColors.orange;
      case JobStatus.offer:
        return AppColors.green;
      case JobStatus.rejected:
        return AppColors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 9,
        vertical: 5,
      ),
      decoration: BoxDecoration(
        color: color.withValues(alpha: .10),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 9,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}