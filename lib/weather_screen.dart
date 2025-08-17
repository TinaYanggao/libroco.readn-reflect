import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  final String location;
  final String mainTemp;
  final String weatherDescription;
  final int humidity;
  final int windSpeed;
  final String timeIndicator;
  final List<HourlyWeather> hourlyForecast;

  const WeatherScreen({
    super.key,
    this.location = "Bamban, Philippines",
    this.mainTemp = "24°C",
    this.weatherDescription = "Expect heavy rainfall and strong lightning",
    this.humidity = 92,
    this.windSpeed = 21,
    this.timeIndicator = "Tonight, 7:00 pm",
    this.hourlyForecast = const [
      HourlyWeather(time: "Now", temp: "24°C", icon: Icons.thunderstorm),
      HourlyWeather(time: "8pm", temp: "26°C", icon: Icons.nightlight_round),
      HourlyWeather(time: "9pm", temp: "21°C", icon: Icons.thunderstorm),
      HourlyWeather(time: "10pm", temp: "20°C", icon: Icons.cloud),
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF947887),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Row(
                  children: [
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFF918D8C),
                        border:
                        Border.all(color: const Color(0xFF918D8C), width: 2),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'READN’REFLECT',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3C090E),
                      ),
                    ),
                  ],
                ),
              ),
              Container(height: 2, width: 550, color: const Color(0xFF3C090E)),
              const SizedBox(height: 12),

              // Location
              Text(
                location,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C090E),
                ),
              ),
              const SizedBox(height: 24),

              // Main Weather Icon + Temperature + Description
              Center(
                child: Column(
                  children: [
                    const Icon(Icons.thunderstorm, size: 100, color: Colors.yellow),
                    const SizedBox(height: 12),
                    Text(
                      mainTemp,
                      style: const TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF3C090E),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      weatherDescription,
                      style: const TextStyle(fontSize: 18, color: Color(0xFF3C090E)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              // Divider
              Center(
                child: Container(
                  width: 400,
                  height: 2,
                  color: const Color(0xFF3C090E),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  "Temperature Display:",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C090E),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Temperature Display Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WeatherDetail(icon: Icons.thermostat, label: mainTemp, iconColor: Colors.black, fontSize: 10),
                  const SizedBox(width: 20),
                  WeatherDetail(icon: Icons.water_drop, label: "$humidity%", iconColor: Colors.black, fontSize: 10),
                  const SizedBox(width: 20),
                  WeatherDetail(icon: Icons.air, label: "$windSpeed km/h", iconColor: Colors.black, fontSize: 10),
                ],
              ),

              const SizedBox(height: 16),
              // Divider
              Center(
                child: Container(
                  width: 420,
                  height: 2,
                  color: const Color(0xFF3C090E),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  "Time Indicator:",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C090E),
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                timeIndicator,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15, // updated font size
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF3C090E),
                ),
              ),

              const SizedBox(height: 16),
              // Divider
              Center(
                child: Container(
                  width: 420,
                  height: 2,
                  color: const Color(0xFF3C090E),
                ),
              ),
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  "Hourly Forecast:",
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF3C090E),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Hourly Forecast Scroll
              SizedBox(
                height: 140,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: hourlyForecast.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (_, index) {
                    final forecast = hourlyForecast[index];
                    return HourlyForecast(
                      time: forecast.time,
                      temp: forecast.temp,
                      icon: forecast.icon,
                      fontSize: 10,
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class WeatherDetail extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color iconColor;
  final double fontSize;

  const WeatherDetail({super.key, required this.icon, required this.label, this.iconColor = Colors.white, this.fontSize = 18});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 36, color: iconColor),
        const SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Color(0xFF3C090E)),
        ),
      ],
    );
  }
}

class HourlyForecast extends StatelessWidget {
  final String time;
  final String temp;
  final IconData icon;
  final double fontSize;

  const HourlyForecast({super.key, required this.time, required this.temp, required this.icon, this.fontSize = 18});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFBFA0B0),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: Colors.black),
          const SizedBox(height: 10),
          Text(time, style: TextStyle(color: Colors.black, fontSize: fontSize)),
          const SizedBox(height: 6),
          Text(temp, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: fontSize)),
        ],
      ),
    );
  }
}

// Model class for hourly forecast
class HourlyWeather {
  final String time;
  final String temp;
  final IconData icon;

  const HourlyWeather({required this.time, required this.temp, required this.icon});
}
