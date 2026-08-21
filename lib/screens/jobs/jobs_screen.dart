import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../data/job_data.dart';
import '../../models/job.dart';
import '../../widgets/job_card.dart';
import '../job_details/job_details_screen.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() =>
      _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  String selectedFilter = 'All';

  final filters = [
    'All',
    'Applied',
    'Interview',
    'Offer',
    'Rejected',
  ];

  List<Job> get filteredJobs {
    if (selectedFilter == 'All') {
      return JobData.jobs;
    }

    return JobData.jobs.where((job) {
      switch (selectedFilter) {
        case 'Applied':
          return job.status == JobStatus.applied;
        case 'Interview':
          return job.status == JobStatus.interview;
        case 'Offer':
          return job.status == JobStatus.offer;
        case 'Rejected':
          return job.status == JobStatus.rejected;
        default:
          return true;
      }
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          20,
          20,
          20,
          30,
        ),
        children: [
          const Text(
            'My Applications',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 25,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            'Keep track of every opportunity.',
            style: TextStyle(
              color: AppColors.textSecondary,
              fontSize: 10,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search jobs or companies...',
              prefixIcon: const Icon(
                Icons.search_rounded,
              ),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.tune_rounded,
                ),
              ),
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 40,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                final filter = filters[index];
                final selected =
                    selectedFilter == filter;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = filter;
                    });
                  },
                  child: Container(
                    margin:
                    const EdgeInsets.only(right: 8),
                    padding:
                    const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: selected
                          ? AppColors.primary
                          : AppColors.surface,
                      borderRadius:
                      BorderRadius.circular(20),
                      border: Border.all(
                        color: selected
                            ? AppColors.primary
                            : AppColors.border,
                      ),
                    ),
                    child: Text(
                      filter,
                      style: TextStyle(
                        color: selected
                            ? Colors.white
                            : AppColors.textSecondary,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          ...filteredJobs.map(
                (job) => JobCard(
              job: job,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        JobDetailsScreen(job: job),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}