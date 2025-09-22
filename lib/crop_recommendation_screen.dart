import 'package:flutter/material.dart';

class CropRecommendationScreen extends StatefulWidget {
  const CropRecommendationScreen({super.key});

  @override
  State<CropRecommendationScreen> createState() => _CropRecommendationScreenState();
}

class _CropRecommendationScreenState extends State<CropRecommendationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Crop Recommendation',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'Crop Recommendation Page Content',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
