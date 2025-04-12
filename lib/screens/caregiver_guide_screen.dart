import 'package:flutter/material.dart';

class CaregiverGuideScreen extends StatelessWidget {
  const CaregiverGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Caregiver Guide'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            'Support Starts With You 💚',
            style: TextStyle(color:Colors.black,fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          CaregiverTile(
            title: "Understanding Dementia",
            subtitle:
            "Learn what dementia is and how it affects behavior, thinking, and memory.",
            icon: Icons.info_outline,
          ),
          CaregiverTile(
            title: "Tips for Communication",
            subtitle:
            "Speak slowly, use gestures, and be patient. Simple, clear language is key.",
            icon: Icons.chat_bubble_outline,
          ),
          CaregiverTile(
            title: "Safe Home Setup",
            subtitle:
            "Remove hazards, label items, and keep emergency numbers visible.",
            icon: Icons.home_outlined,
          ),
          CaregiverTile(
            title: "Daily Routines",
            subtitle:
            "Keep activities consistent and enjoyable. Use checklists to stay organized.",
            icon: Icons.schedule_outlined,
          ),
          CaregiverTile(
            title: "Self-Care for Caregivers",
            subtitle:
            "Take breaks, eat well, sleep, and don't hesitate to ask for help.",
            icon: Icons.favorite_outline,
          ),
          CaregiverTile(
            title: "Emergency Plan",
            subtitle:
            "Keep contacts ready and stay calm. Your presence brings comfort.",
            icon: Icons.warning_amber_outlined,
          ),
        ],
      ),
    );
  }
}

class CaregiverTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const CaregiverTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,  // Increased elevation for a more prominent tile
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.grey[100],  // Light gray background for the tile to differentiate from the white background
      child: ListTile(
        leading: Icon(icon, color: Colors.teal, size: 30),
        title: Text(
          title,
          style: const TextStyle(color: Colors.teal, fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(color: Colors.black),
        ),
        tileColor: Colors.white,  // White background for each ListTile itself
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
