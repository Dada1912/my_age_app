import 'package:flutter/material.dart';

void main() {
  runApp(const AgeApp());
}

class AgeApp extends StatelessWidget {
  const AgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AgeHome(),
    );
  }
}

class AgeHome extends StatefulWidget {
  const AgeHome({super.key});

  @override
  State<AgeHome> createState() => _AgeHomeState();
}

class _AgeHomeState extends State<AgeHome> {
  String message = 'ದಿನಾಂಕ ಆಯ್ಕೆ ಮಾಡಿ 👇';

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      final now = DateTime.now();
      final age = now.year - picked.year;
      setState(() {
        message = 'ನಿಮ್ಮ ವಯಸ್ಸು: $age ವರ್ಷ 🎉';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ವಯಸ್ಸು ಲೆಕ್ಕಾಚಾರ 📅')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickDate,
              child: const Text('Select Date of Birth'),
            ),
          ],
        ),
      ),
    );
  }
}
