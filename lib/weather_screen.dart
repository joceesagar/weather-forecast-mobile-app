import 'dart:ui';

import 'package:flutter/material.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App',
        style: TextStyle(
          fontWeight:FontWeight.bold
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){},
           icon: const Icon(Icons.refresh)
           )
        ],
      ),
      body: Padding(
        padding:  const EdgeInsets.all(16.0),
        child:  Column(
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
                          Text('300° K',
                          style: TextStyle(
                            fontSize: 48,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                           SizedBox(height: 16,),
                          Icon(Icons.cloud,
                          size: 108,
                          ),
                           SizedBox(height: 16,),
                          Text('Rain',
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
            const SizedBox( height: 20, ),
        
            //weather forecast cards
            const Placeholder(fallbackHeight: 150,),
            const SizedBox( height: 20, ),
        
            //additional information
            const Placeholder(fallbackHeight: 150,),
        
          ],
        ),
      ),
      
    );
  }
}