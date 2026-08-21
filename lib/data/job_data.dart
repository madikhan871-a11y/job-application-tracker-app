import '../models/job.dart';

class JobData {
  static const jobs = [
    Job(
      id: '1',
      company: 'Google',
      position: 'Flutter Developer',
      location: 'Remote',
      type: 'Full Time',
      salary: '\$4,500 - \$6,000',
      logo: 'G',
      status: JobStatus.interview,
      appliedDate: 'Aug 18, 2026',
      interviewDate: 'Aug 25, 2026',
      description:
      'Build high-quality mobile experiences and collaborate with product and engineering teams.',
    ),
    Job(
      id: '2',
      company: 'Microsoft',
      position: 'Software Engineer',
      location: 'Islamabad',
      type: 'Full Time',
      salary: '\$3,500 - \$5,000',
      logo: 'M',
      status: JobStatus.applied,
      appliedDate: 'Aug 16, 2026',
      description:
      'Work on scalable software solutions and contribute to modern engineering projects.',
    ),
    Job(
      id: '3',
      company: 'Airbnb',
      position: 'Mobile Developer',
      location: 'Remote',
      type: 'Contract',
      salary: '\$4,000 - \$5,500',
      logo: 'A',
      status: JobStatus.offer,
      appliedDate: 'Aug 10, 2026',
      description:
      'Create beautiful mobile experiences for travelers and hosts around the world.',
    ),
    Job(
      id: '4',
      company: 'Spotify',
      position: 'UI Engineer',
      location: 'Remote',
      type: 'Full Time',
      salary: '\$4,200 - \$5,800',
      logo: 'S',
      status: JobStatus.applied,
      appliedDate: 'Aug 08, 2026',
      description:
      'Design and implement engaging interfaces for millions of users.',
    ),
    Job(
      id: '5',
      company: 'Amazon',
      position: 'Frontend Developer',
      location: 'Lahore',
      type: 'Full Time',
      salary: '\$3,800 - \$5,200',
      logo: 'A',
      status: JobStatus.rejected,
      appliedDate: 'Aug 02, 2026',
      description:
      'Develop modern web and mobile interfaces for customer-facing products.',
    ),
  ];

  static int countByStatus(JobStatus status) {
    return jobs.where((job) => job.status == status).length;
  }
}