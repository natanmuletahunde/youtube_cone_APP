import 'package:flutter/material.dart';
import 'package:drappointment/utils/config.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  State<AppointmentPage> createState() => _AppointmentPageState();
}

enum FilterStatus { upcoming, complete, cancel }

class _AppointmentPageState extends State<AppointmentPage> {
  FilterStatus status = FilterStatus.upcoming;
  Alignment _alignment = Alignment.centerLeft;

  List<Map<String, String>> schedules = [
    {
      "doctor_name": "Richard Tan",
      "doctor_profile": "assets/doctor2.jpg",
      "category": "Dental",
      "status": "upcoming",
    },
    {
      "doctor_name": "Max Lim",
      "doctor_profile": "assets/doctor3.jpg",
      "category": "Cardiology",
      "status": "complete",
    },
    {
      "doctor_name": "Jane Wong",
      "doctor_profile": "assets/doctor4.jpg",
      "category": "Respiration",
      "status": "complete",
    },
    {
      "doctor_name": "Jenny Song",
      "doctor_profile": "assets/doctor5.jpg",
      "category": "General",
      "status": "cancel",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filtered appointment schedules
    List<Map<String, String>> filteredSchedules = schedules.where((schedule) {
      return schedule['status'] == status.name;
    }).toList();

    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Appointment Schedule',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Config.spaceSmall,
          ],
        ),
      ),
    );
  }
}
