import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart'; // Add file_picker package dependency
import 'result_screen.dart';

class AssessmentScreen extends StatefulWidget {
  const AssessmentScreen({super.key});

  @override
  _AssessmentScreenState createState() {
    return _AssessmentScreenState();
  }
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  bool isUploading = false;
  bool isUploaded = false;
  double accuracy = 75.0; // Example accuracy
  String riskLevel = "Moderate Risk"; // Example risk level
  String? fileName;

  // This function opens the file picker to select an audio file.
  void uploadAudio() async {
    setState(() {
      isUploading = true;
      isUploaded = false;
    });

    // Open the file picker with allowed audio file types.
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3', 'wav', 'm4a'],
    );

    if (result != null) {
      setState(() {
        isUploading = false;
        isUploaded = true;
        fileName = result.files.single.name;
      });
    } else {
      // User canceled the picker.
      setState(() {
        isUploading = false;
        isUploaded = false;
      });
    }
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image related to dementia
              Image.asset(
                'assets/images/png/upload_rec.png',
                height: 350,
                width: 350,
              ),
              const SizedBox(height: 20),
              // Instruction text to upload the audio file.
              const Text(
                'Please upload an audio recording to test cognitive functions.',
                style: TextStyle(color: Colors.black, fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              // Upload Audio File button.
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  iconColor: Colors.teal,  // Greenish button color
                ),
                onPressed: isUploading ? null : uploadAudio,
                child: isUploading
                    ? const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                )
                    : const Text(
                  'Upload Audio File',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              // Display file upload status.
              Text(
                isUploaded
                    ? 'Uploaded: $fileName'
                    : 'No audio file uploaded yet',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 20),
              // "See Results" button appears after successful upload.
              if (isUploaded)
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,  // Greenish button color
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultScreen(
                          accuracy: accuracy,
                          riskLevel: riskLevel,
                        ),
                      ),
                    );
                  },
                  child: const Text(
                    'Click to Proceed',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
