import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../models/job.dart';
import '../../widgets/status_chip.dart';

class JobDetailsScreen extends StatelessWidget {
  final Job job;

  const JobDetailsScreen({
    super.key,
    required this.job,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Job Details',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_border_rounded,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Center(
            child: Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(
                  alpha: .08,
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Center(
                child: Text(
                  job.logo,
                  style: const TextStyle(
                    color: AppColors.primary,
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: Text(
              job.position,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 23,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
          const SizedBox(height: 6),
          Center(
            child: Text(
              job.company,
              style: const TextStyle(
                color: AppColors.textSecondary,
                fontSize: 11,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: StatusChip(
              status: job.status,
            ),
          ),
          const SizedBox(height: 25),
          _infoGrid(),
          const SizedBox(height: 22),
          _section(
            'Job Description',
            job.description,
          ),
          const SizedBox(height: 22),
          _timeline(),
          const SizedBox(height: 25),
          SizedBox(
            height: 52,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Update Application',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoGrid() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: AppColors.border,
        ),
      ),
      child: Row(
        children: [
          _infoItem(
            Icons.location_on_outlined,
            job.location,
            'Location',
          ),
          _infoItem(
            Icons.work_outline_rounded,
            job.type,
            'Job Type',
          ),
          _infoItem(
            Icons.payments_outlined,
            job.salary,
            'Salary',
          ),
        ],
      ),
    );
  }

  Widget _infoItem(
      IconData icon,
      String value,
      String label,
      ) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 18,
          ),
          const SizedBox(height: 7),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppColors.textPrimary,
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 7,
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(
      String title,
      String content,
      ) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          content,
          style: const TextStyle(
            color: AppColors.textSecondary,
            fontSize: 10,
            height: 1.6,
          ),
        ),
      ],
    );
  }

  Widget _timeline() {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        const Text(
          'Application Timeline',
          style: TextStyle(
            color: AppColors.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(height: 15),
        _timelineItem(
          'Application submitted',
          job.appliedDate,
          true,
        ),
        if (job.interviewDate != null)
          _timelineItem(
            'Interview scheduled',
            job.interviewDate!,
            job.status == JobStatus.interview ||
                job.status == JobStatus.offer,
          ),
      ],
    );
  }

  Widget _timelineItem(
      String title,
      String date,
      bool active,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Container(
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              color: active
                  ? AppColors.primary
                  : AppColors.border,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.textPrimary,
                fontSize: 10,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Text(
            date,
            style: const TextStyle(
              color: AppColors.textSecondary,
              fontSize: 8,
            ),
          ),
        ],
      ),
    );
  }
}