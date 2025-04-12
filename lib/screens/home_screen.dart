import 'package:flutter/material.dart';
import 'assessment_screen.dart';
import 'caregiver_guide_screen.dart';
import 'memory_exercises_screen.dart';
import 'about_Screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'DemCare',
          style: TextStyle(
            color: Colors.teal,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.teal),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfileScreen()),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                'assets/images/dem_Ai.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 180,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Welcome!',
              style: TextStyle(
                color: Colors.black,
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Lets get Started,Take an Assessment',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 12),
            GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildOption(
                  context,
                  'Assessment',
                  Icons.mic,
                  AssessmentScreen(),
                ),
                _buildOption(
                  context,
                  'About DemCare',
                  Icons.book,
                  const AboutDemCarePage(),
                ),
                _buildOption(
                  context,
                  'Caregiver Guide',
                  Icons.local_hospital,
                  const CaregiverGuideScreen(),
                ),
                _buildOption(
                  context,
                  'Memory Exercises',
                  Icons.psychology,
                  const MemoryExercisesScreen(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(
      BuildContext context,
      String title,
      IconData icon,
      Widget screen,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Card(
        elevation: 3,
        color: Colors.teal.shade50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.teal),
              const SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
