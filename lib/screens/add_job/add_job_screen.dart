import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class AddJobScreen extends StatefulWidget {
  const AddJobScreen({super.key});

  @override
  State<AddJobScreen> createState() =>
      _AddJobScreenState();
}

class _AddJobScreenState
    extends State<AddJobScreen> {
  final companyController =
  TextEditingController();
  final positionController =
  TextEditingController();
  final locationController =
  TextEditingController();
  final salaryController =
  TextEditingController();

  String selectedType = 'Full Time';

  @override
  void dispose() {
    companyController.dispose();
    positionController.dispose();
    locationController.dispose();
    salaryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text(
          'Add Application',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _field(
            'Company Name',
            'e.g. Google',
            companyController,
          ),
          _field(
            'Job Position',
            'e.g. Flutter Developer',
            positionController,
          ),
          _field(
            'Location',
            'e.g. Remote',
            locationController,
          ),
          _field(
            'Salary',
            'e.g. \$3,000 - \$4,000',
            salaryController,
          ),
          const SizedBox(height: 5),
          const Text(
            'Job Type',
            style: TextStyle(
              color: AppColors.textPrimary,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: [
              'Full Time',
              'Part Time',
              'Contract',
              'Internship',
            ].map((type) {
              final selected =
                  selectedType == type;

              return ChoiceChip(
                label: Text(type),
                selected: selected,
                onSelected: (_) {
                  setState(() {
                    selectedType = type;
                  });
                },
                selectedColor:
                AppColors.primary,
                labelStyle: TextStyle(
                  color: selected
                      ? Colors.white
                      : AppColors.textSecondary,
                  fontSize: 9,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 54,
            child: ElevatedButton(
              onPressed: () {
                if (companyController
                    .text
                    .trim()
                    .isEmpty ||
                    positionController
                        .text
                        .trim()
                        .isEmpty) {
                  return;
                }

                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Save Application',
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

  Widget _field(
      String label,
      String hint,
      TextEditingController controller,
      ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
        ),
      ),
    );
  }
}