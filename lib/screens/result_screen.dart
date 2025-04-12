import 'dart:async';
import 'package:flutter/material.dart';
import 'feedback_screen.dart'; // Import the feedback screen

class ResultScreen extends StatefulWidget {
  final double accuracy;
  final String riskLevel;

  const ResultScreen({
    super.key,
    required this.accuracy,
    required this.riskLevel,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    // Delay for 3 seconds before showing results
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Assessment Results'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: _isLoading
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Analyzing your audio...',
              style: TextStyle(
                fontSize: 20,
                color: Colors.teal,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 30),
            CircularProgressIndicator(color: Colors.teal),
          ],
        )
            : Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline,
                  size: 80, color: Colors.teal),
              const SizedBox(height: 20),
              const Text(
                'Preliminary Analysis Complete',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Estimated Accuracy: ${widget.accuracy.toStringAsFixed(1)}%',
                style: const TextStyle(
                    fontSize: 18, color: Colors.black26),
              ),
              const SizedBox(height: 10),
              Text(
                'Risk Level: ${widget.riskLevel}',
                style: TextStyle(
                  fontSize: 18,
                  color: widget.riskLevel.contains("High")
                      ? Colors.red
                      : (widget.riskLevel.contains("Moderate")
                      ? Colors.orange
                      : Colors.green),
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                '⚠️ Please note: This is not a medical diagnosis.\n More comprehensive testing is recommended.',
                style: TextStyle(
                  fontSize: 14,
                  fontStyle: FontStyle.italic,
                  color: Colors.black54,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              // Feedback Button
              TextButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FeedbackScreen(),
                    ),
                  );
                },
                icon: const Icon(Icons.feedback_outlined,
                    color: Colors.teal),
                label: const Text(
                  "Give Feedback",
                  style: TextStyle(
                    color: Colors.teal,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
