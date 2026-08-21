import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';
import '../../data/job_data.dart';
import '../../models/job.dart';
import '../../widgets/app_bottom_nav.dart';
import '../../widgets/job_card.dart';
import '../../widgets/stat_card.dart';
import '../add_job/add_job_screen.dart';
import '../job_details/job_details_screen.dart';
import '../jobs/jobs_screen.dart';
import '../profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() =>
      _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void openJob(Job job) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => JobDetailsScreen(job: job),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      _dashboard(),
      const JobsScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: AppBottomNav(
        currentIndex: currentIndex,
        onChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      floatingActionButton: currentIndex == 0
          ? FloatingActionButton(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddJobScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      )
          : null,
    );
  }

  Widget _dashboard() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          20,
          20,
          20,
          90,
        ),
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Good morning 👋',
                      style: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 11,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Job Tracker',
                      style: TextStyle(
                        color: AppColors.textPrimary,
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: AppColors.border,
                  ),
                ),
                child: const Icon(
                  Icons.notifications_none_rounded,
                  color: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          _progressCard(),
          const SizedBox(height: 22),
          const Text(
            'Application Overview',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            height: 125,
            child: Row(
              children: [
                Expanded(
                  child: StatCard(
                    title: 'Applied',
                    value:
                    '${JobData.countByStatus(JobStatus.applied)}',
                    icon: Icons.send_rounded,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: StatCard(
                    title: 'Interviews',
                    value:
                    '${JobData.countByStatus(JobStatus.interview)}',
                    icon: Icons.groups_rounded,
                    color: AppColors.orange,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: StatCard(
                    title: 'Offers',
                    value:
                    '${JobData.countByStatus(JobStatus.offer)}',
                    icon: Icons.verified_rounded,
                    color: AppColors.green,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Recent Applications',
                  style: TextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child: const Text(
                  'View all',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...JobData.jobs.take(3).map(
                (job) => JobCard(
              job: job,
              onTap: () => openJob(job),
            ),
          ),
        ],
      ),
    );
  }

  Widget _progressCard() {
    const total = 10;
    const completed = 6;
    const progress = completed / total;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            AppColors.primary,
            AppColors.primaryDark,
          ],
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Your job search\nis on track!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w900,
                    height: 1.2,
                  ),
                ),
              ),
              Container(
                width: 58,
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(
                    alpha: .15,
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    '60%',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 7,
              backgroundColor: Colors.white24,
              valueColor:
              const AlwaysStoppedAnimation(
                Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 9),
          const Text(
            '6 of 10 weekly applications completed',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }
}