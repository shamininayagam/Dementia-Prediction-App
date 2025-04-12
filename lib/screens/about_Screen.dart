import 'package:flutter/material.dart';

class AboutDemCarePage extends StatelessWidget {
  const AboutDemCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('About DemCare'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'What is DemCare?',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'DemCare is an AI-powered mobile application designed to aid in the early detection of dementia using voice analysis. '
                  'Through speech and verbal fluency patterns, it can indicate cognitive risk factors, helping individuals seek professional guidance earlier.',
              style: TextStyle(color:Colors.black,fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            const Text(
              'Why is Early Detection Important?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Dementia is a progressive neurological condition that affects memory, thinking, and communication. '
                  'It impairs cognitive functions, making it harder for individuals to carry out daily tasks. Early symptoms often include difficulty finding words, confusion, and short-term memory loss.',
              style: TextStyle(color:Colors.black,fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            const Text(
              'Dementia typically affects older adults, but early onset can occur in those under 65. As the condition progresses, the person may struggle to remember names, manage finances, or even recognize loved ones. However, with early detection, proper interventions, and therapies, the progression can be slowed, allowing patients to maintain independence longer and improve quality of life.',
              style: TextStyle(color:Colors.black,fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 20),
            const Text(
              'How DemCare Helps',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'DemCare uses voice analysis to detect potential early signs of cognitive decline. By analyzing speech patterns, fluency, and pronunciation, the app identifies irregularities that could suggest cognitive impairment.',
              style: TextStyle(color:Colors.black,fontSize: 16),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 10),
            const Text(
              'Although it is not a medical diagnostic tool, DemCare serves as a first step in identifying individuals who may benefit from further clinical assessment. The app encourages users to consult healthcare professionals if it detects early signs of dementia, making early intervention more accessible and promoting proactive care.',
              style: TextStyle(color:Colors.black,fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
