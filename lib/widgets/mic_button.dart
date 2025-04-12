import 'package:flutter/material.dart';

class MicButton extends StatefulWidget {
  final bool isRecording;
  final VoidCallback onStartRecording;
  final VoidCallback onStopRecording;

  const MicButton({
    Key? key,
    required this.isRecording,
    required this.onStartRecording,
    required this.onStopRecording,
  }) : super(key: key);

  @override
  _MicButtonState createState() => _MicButtonState();
}

class _MicButtonState extends State<MicButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isRecording ? widget.onStopRecording : widget.onStartRecording,
      child: Icon(
        Icons.mic,
        size: 60,
        color: widget.isRecording ? Colors.red : Colors.purple,
      ),
    );
  }
}

