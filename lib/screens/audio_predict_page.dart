import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class AudioPredictPage extends StatefulWidget {
  const AudioPredictPage({super.key});

  @override
  State<AudioPredictPage> createState() => _AudioPredictPageState();
}

class _AudioPredictPageState extends State<AudioPredictPage> {
  String? _prediction;
  double? _confidenceAD;
  double? _confidenceCN;
  bool _isLoading = false;
  String? _error;

  Future<void> _pickAndSendAudio() async {
    setState(() {
      _isLoading = true;
      _prediction = null;
      _error = null;
    });

    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['wav'],
      );

      if (result == null || result.files.single.path == null) {
        setState(() {
          _isLoading = false;
          _error = 'No file selected.';
        });
        return;
      }

      File audioFile = File(result.files.single.path!);

      var url = Uri.parse('http://127.0.0.1:5000/ping');

      try {
        var response = await http.get(url).timeout(Duration(seconds: 10));
        if (response.statusCode == 200) {
          print('Server says: ${response.body}');
        } else {
          print('Failed with status: ${response.statusCode}');
        }
      } catch (e) {
        print('Error connecting to server: $e');
      }


      var uri = Uri.parse('http://127.0.0.1:5000/predict');
      print(uri);
      var request = http.MultipartRequest('POST', uri)
        ..files.add(await http.MultipartFile.fromPath('file', audioFile.path));
      print(request);
      var response = await request.send().timeout(Duration(seconds: 500));
      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        final data = json.decode(responseBody);

        setState(() {
          _prediction = data['class_name'];
          _confidenceAD = data['confidence']['AD'];
          _confidenceCN = data['confidence']['CN'];
          _isLoading = false;
        });
      } else {
        final errorText = await response.stream.bytesToString();
        setState(() {
          _error = 'Server error: $errorText';
          _isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        _error = 'Unexpected error: $e';
        _isLoading = false;
      });
    }
  }

  Widget _buildResultSection() {
    if (_isLoading) {
      return const CircularProgressIndicator();
    }

    if (_error != null) {
      return Text(_error!, style: const TextStyle(color: Colors.red));
    }

    if (_prediction != null) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Prediction: $_prediction',
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text('Confidence (AD): ${(_confidenceAD! * 100).toStringAsFixed(2)}%'),
          Text('Confidence (CN): ${(_confidenceCN! * 100).toStringAsFixed(2)}%'),
        ],
      );
    }

    return const Text('No prediction yet.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Dementia Classifier'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: _pickAndSendAudio,
              icon: const Icon(Icons.upload_file),
              label: const Text("Select & Predict Audio"),
            ),
            const SizedBox(height: 30),
            _buildResultSection(),
          ],
        ),
      ),
    );
  }
}
