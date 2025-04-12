import 'package:flutter/material.dart';

class MemoryExercisesScreen extends StatelessWidget {
  const MemoryExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Memory Exercises'),
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          Text(
            'Boost Your Brain Power! ⚡',
            style: TextStyle(color: Colors.black,fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 12),
          MemoryTile(
            title: "🎵 Name That Tune",
            subtitle:
            "Play a few seconds of a song and guess the name — music helps memory recall.",
            icon: Icons.music_note,
          ),
          MemoryTile(
            title: "🧠 Word Association",
            subtitle:
            "Say a word and respond with the first word that comes to mind.",
            icon: Icons.text_fields,
          ),
          MemoryTile(
            title: "📸 Photo Reminiscing",
            subtitle:
            "View old photos and talk about the people, places, and stories behind them.",
            icon: Icons.photo_album_outlined,
          ),
          MemoryTile(
            title: "➕ Simple Math",
            subtitle:
            "Do quick math problems together to keep the brain active.",
            icon: Icons.calculate_outlined,
          ),
          MemoryTile(
            title: "📖 Story Building",
            subtitle:
            "Start a story and let the other person build it one sentence at a time.",
            icon: Icons.edit_note_outlined,
          ),
          MemoryTile(
            title: "🧺 Object Recall",
            subtitle:
            "Show a few items, then hide them and ask what they remember.",
            icon: Icons.visibility_outlined,
          ),
          MemoryTile(
            title: "🕵️ Spot the Difference",
            subtitle:
            "Use two similar images and find small differences together.",
            icon: Icons.find_in_page_outlined,
          ),
        ],
      ),
    );
  }
}

class MemoryTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  const MemoryTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Colors.grey[100],
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
        tileColor: Colors.white,  // White background for each tile
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}
