import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weather_app/additional_info.dart';
import 'package:weather_app/weather_cards.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
@override
  void initState() {
    super.initState();
    getCurrentWeather();
  }
  

  Future getCurrentWeather() async{
    String ? apiKey = dotenv.env['API_KEY'];
    String cityName = 'London';
    if(apiKey == null || apiKey.isEmpty){
      throw Exception('Api key is missing in the .env file');
    }

    final res = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&APPID=$apiKey'
    ),
    );
    print(res.body);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //main card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 16,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '300° K',
                            style: TextStyle(
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 108,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Rain',
                            style: TextStyle(
                              fontSize: 24,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 32,
            ),

            //weather forecast cards
            const Text(
              "Weather Forecast",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  WeatherCards(
                    time: '4:11',
                    icon: Icons.cloud,
                    value: '320.12',
                  ),
                  WeatherCards(
                    time: '4:11',
                    icon: Icons.sunny,
                    value: '320.12',
                  ),
                  WeatherCards(
                    time: '4:11',
                    icon: Icons.cloud,
                    value: '320.12',
                  ),
                  WeatherCards(
                    time: '4:11',
                    icon: Icons.sunny,
                    value: '320.12',
                  ),
                  WeatherCards(
                    time: '4:11',
                    icon: Icons.cloud,
                    value: '320.12',
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 32,
            ),

            //additional information
            const Text(
              "Additional Information",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInfo(
                  icon: Icons.water_drop_outlined,
                  label: 'Humidity',
                  value: '96.5',
                ),
                AdditionalInfo(
                  icon: Icons.air,
                  label: 'Wind Speed',
                  value: '7.75',
                ),
                AdditionalInfo(
                  icon: Icons.beach_access,
                  label: 'Pressure',
                  value: '1006',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

