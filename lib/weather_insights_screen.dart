import 'package:flutter/material.dart';

class WeatherInsightsScreen extends StatefulWidget {
  const WeatherInsightsScreen({super.key});

  @override
  State<WeatherInsightsScreen> createState() => _WeatherInsightsScreenState();
}

class _WeatherInsightsScreenState extends State<WeatherInsightsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Weather Insights',
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
              'Current Conditions',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),
            // Current Weather Card
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.green.shade50,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.wb_sunny_outlined, size: 40, color: Colors.green),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sunny',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          '28°C | Feels like 30°C',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.green.shade50,
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.water_drop_outlined, size: 30, color: Colors.green),
                          SizedBox(height: 8),
                          Text(
                            'Humidity',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            '75%',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.green.shade50,
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(Icons.air, size: 30, color: Colors.green),
                          SizedBox(height: 8),
                          Text(
                            'Wind',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            '15 km/h',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),
            const Text(
              '5-Day Forecast',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),
            // Forecast List Tiles
            _buildForecastTile('Tomorrow', 'Partly Cloudy', '26° / 20°', Icons.wb_cloudy_outlined), // Changed icon to partly cloudy
            const SizedBox(height: 10),
            _buildForecastTile('Wednesday', 'Sunny', '27° / 21°', Icons.wb_sunny_outlined),
            const SizedBox(height: 10),
            _buildForecastTile('Thursday', 'Rain', '25° / 19°', Icons.cloudy_snowing),
            const SizedBox(height: 10),
            _buildForecastTile('Friday', 'Cloudy', '24° / 18°', Icons.cloud_outlined),
            const SizedBox(height: 10),
            _buildForecastTile('Saturday', 'Sunny', '26° / 20°', Icons.wb_sunny_outlined),
            const SizedBox(height: 25),
            // Impact on Crops
            const Text(
              'Impact on Crops',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 15),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.green.shade50,
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.agriculture_outlined, size: 30, color: Colors.green),
                    SizedBox(width: 15),
                    Expanded(
                      child: Text(
                        'The upcoming sunny weather is ideal for planting maize and sorghum. However, be prepared for potential rain on Thursday, which may affect planting schedules for sensitive crops like tomatoes. Consider adjusting irrigation for crops that prefer drier conditions.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForecastTile(String day, String condition, String temperature, IconData icon) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Colors.green.shade50,
      child: ListTile(
        leading: Icon(icon, color: Colors.green, size: 30),
        title: Text(day, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(condition, style: const TextStyle(color: Colors.black54)),
        trailing: Text(temperature, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
      ),
    );
  }
}
