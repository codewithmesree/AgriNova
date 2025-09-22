import 'package:flutter/material.dart';

class MarketInsightsScreen extends StatefulWidget {
  const MarketInsightsScreen({super.key});

  @override
  State<MarketInsightsScreen> createState() => _MarketInsightsScreenState();
}

class _MarketInsightsScreenState extends State<MarketInsightsScreen> {
  double _currentSliderValue = 10; // Initial radius value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Market Insights',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Filters',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),
            // Select Crop dropdown
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.green.shade50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: null, // No initial value selected
                    hint: const Text('Select Crop', style: TextStyle(color: Colors.black54)),
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.green),
                    items: <String>['Wheat', 'Rice', 'Corn', 'Barley']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // TODO: Implement crop selection logic
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            // Select Mandi dropdown
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.green.shade50,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: null, // No initial value selected
                    hint: const Text('Select Mandi', style: TextStyle(color: Colors.black54)),
                    icon: const Icon(Icons.keyboard_arrow_down, color: Colors.green),
                    items: <String>['Mandi A', 'Mandi B', 'Mandi C']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      // TODO: Implement mandi selection logic
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            // Radius slider
            Row(
              children: [
                const Text(
                  'Radius: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  '${_currentSliderValue.round()}km',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                Expanded(
                  child: Slider(
                    value: _currentSliderValue,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    activeColor: Colors.green,
                    inactiveColor: Colors.green.shade100,
                    label: _currentSliderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSliderValue = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            // Crop Prices Section
            const Text(
              'Crop Prices',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),
            // Wheat Price
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.green.shade50,
              child: ListTile(
                // leading: Image.asset('assets/wheat.png', width: 40, height: 40), // Removed crop icon
                title: const Text('Wheat', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('1200 INR / Quintal', style: TextStyle(color: Colors.green)),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 20),
                onTap: () {
                  // TODO: Navigate to detailed crop page or show more info
                },
              ),
            ),
            const SizedBox(height: 10),
            // Rice Price
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.green.shade50,
              child: ListTile(
                // leading: Image.asset('assets/rice.png', width: 40, height: 40), // Removed crop icon
                title: const Text('Rice', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('1500 INR / Quintal', style: TextStyle(color: Colors.green)),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 20),
                onTap: () {
                  // TODO: Navigate to detailed crop page or show more info
                },
              ),
            ),
            const SizedBox(height: 10),
            // Corn Price
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.green.shade50,
              child: ListTile(
                // leading: Image.asset('assets/corn.png', width: 40, height: 40), // Removed crop icon
                title: const Text('Corn', style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: const Text('800 INR / Quintal', style: TextStyle(color: Colors.green)),
                trailing: const Icon(Icons.arrow_forward_ios, color: Colors.black54, size: 20),
                onTap: () {
                  // TODO: Navigate to detailed crop page or show more info
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
