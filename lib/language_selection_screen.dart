import 'package:flutter/material.dart';
import 'package:sample_flutter_project/registration_screen.dart';

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({super.key});

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  String? _selectedLanguage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Setting background color to white
      appBar: AppBar(
        title: const Text(
          'Select Language',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  _buildLanguageOption('தமிழ்', 'Tamil'),
                  const SizedBox(height: 10),
                  _buildLanguageOption('हिन्दी', 'Hindi'),
                  const SizedBox(height: 10),
                  _buildLanguageOption('తెలుగు', 'Telugu'),
                  const SizedBox(height: 10),
                  _buildLanguageOption('English', 'English'),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _selectedLanguage == null
                    ? null
                    : () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen()));
                        print('Selected Language: $_selectedLanguage');
                      },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // Background color
                  padding: const EdgeInsets.symmetric(vertical: 15), // Vertical padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Rounded corners
                  ),
                ),
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Text color
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLanguageOption(String languageText, String languageValue) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.green.shade50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: RadioListTile<String>(
          title: Text(
            languageText,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          value: languageValue,
          groupValue: _selectedLanguage,
          onChanged: (String? value) {
            setState(() {
              _selectedLanguage = value;
            });
          },
          activeColor: Colors.green,
          controlAffinity: ListTileControlAffinity.trailing,
        ),
      ),
    );
  }
}
