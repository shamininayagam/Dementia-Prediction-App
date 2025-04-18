import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'result_screen.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  State<AssessmentScreen> createState() => _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  bool isUploading = false;
  String? fileName;
  String? filePath;
  String? errorMessage;

  Future<void> uploadAndPredictAudio() async {
    setState(() {
      isUploading = true;
      errorMessage = null;
      fileName = null;
      filePath = null;
    });

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['mp3', 'wav', 'm4a'],
      );

      if (result == null || result.files.single.path == null) {
        setState(() {
          isUploading = false;
          errorMessage = 'No file selected.';
        });
        return;
      }

      filePath = result.files.single.path!;
      fileName = result.files.single.name;

      var uri = Uri.parse('http://127.0.0.1:5000/predict');
      var request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('file', filePath!));

      var response = await request.send().timeout(const Duration(seconds: 500));
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final data = json.decode(responseBody);

        // Extract prediction and confidence
        String prediction = data['class_name'];
        double accuracy = prediction == 'AD'
            ? (data['confidence']['AD'] * 100)
            : (data['confidence']['CN'] * 100);

        String riskLevel = prediction == 'AD'
            ? (accuracy > 85 ? "High Risk" : "Moderate Risk")
            : (accuracy > 85 ? "Low Risk" : "Very Low Risk");

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(
              accuracy: accuracy,
              riskLevel: riskLevel,
            ),
          ),
        );
      } else {
        setState(() {
          errorMessage = "Server error: $responseBody";
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = "Unexpected error: ${e.toString()}";
      });
    }

    setState(() {
      isUploading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Cognitive Assessment'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset('assets/images/png/upload_rec.png', height: 280),
              const SizedBox(height: 20),
              const Text(
                'Please upload an audio recording to test cognitive functions.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.black87),
              ),
              const SizedBox(height: 25),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: isUploading ? null : uploadAndPredictAudio,
                icon: const Icon(Icons.upload_file),
                label: const Text(
                  'Upload & Predict',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
              const SizedBox(height: 15),
              if (fileName != null)
                Text(
                  'Selected: $fileName',
                  style: const TextStyle(fontSize: 16),
                ),
              if (errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),
                ),
              if (isUploading)
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
