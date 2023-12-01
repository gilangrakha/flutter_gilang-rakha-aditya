import 'package:flutter/material.dart';
import 'event_model.dart';

class EventDetailPage extends StatelessWidget {
  final Event event;

  EventDetailPage({required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            event.imageUrl,
            height: 291,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(

            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.add_location_rounded,
                        size: 16, 
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        event.location,
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    event.detail_location,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Tampilkan di peta',
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  ),
                  Container(
                    height: 1,
                    width: 240,
                    
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
