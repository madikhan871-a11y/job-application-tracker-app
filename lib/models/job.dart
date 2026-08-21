enum JobStatus {
  applied,
  interview,
  offer,
  rejected,
}

class Job {
  final String id;
  final String company;
  final String position;
  final String location;
  final String type;
  final String salary;
  final String logo;
  final JobStatus status;
  final String appliedDate;
  final String? interviewDate;
  final String description;

  const Job({
    required this.id,
    required this.company,
    required this.position,
    required this.location,
    required this.type,
    required this.salary,
    required this.logo,
    required this.status,
    required this.appliedDate,
    this.interviewDate,
    required this.description,
  });
}