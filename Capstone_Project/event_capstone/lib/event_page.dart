import 'package:flutter/material.dart';
import 'event_model.dart';
import 'event_detail_page.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<Event> events = [
    Event(
      title: 'Alkafest 2023 Closing Ceremony',
      imageUrl: 'assets/images/event/alkafest.png',
      description: 'Hello Fellas! SMAI Al-Azhar Kelapa Gading \nProudly Presents  “CLOSING CEREMONY ALKAFEST”!',
      location: 'Mahaka Square',
      detail_location: 'Britama Arena Mahaka Square',
    ),
    Event(
      title: 'Akurat Festival',
      imageUrl: 'assets/images/event/akurat.png',
      description: 'Description for Event 2',
      location: 'Mahaka Square',
      detail_location: 'Britama Arena Mahaka Square',
    ),
    Event(
      title: 'Run With Me',
      imageUrl: 'assets/images/event/runwme.png',
      description: 'Description for Event 3',
      location: 'Mahaka Square',
      detail_location: 'Britama Arena Mahaka Square',
    ),
    // Add more events as needed
  ];

  List<String> categories = ['Workshop', 'Event', 'Pameran', 'Festival'];

  String searchTerm = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10, top: 10),
          child: Row(
            children: [
              Icon(Icons.arrow_back, color: Colors.black),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.grey[200],
                  ),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchTerm = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      prefixIcon: Icon(Icons.search, color: Colors.black,),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.grey.shade300, width: 1)
                      )
                    ),
                  ),
                ),
              ),
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: Colors.cyan.shade500,
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Icon(Icons.sort)
              )
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {

                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                        )
                      ),
                      child: Text(categories[index], style: TextStyle(
                        color: Colors.white
                      ),),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                if (events[index].title.toLowerCase().contains(searchTerm.toLowerCase())) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailPage(event: events[index]),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                      child: Container(
                        height: 257,
                        width: 345,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              spreadRadius: 2,
                              blurRadius: 1,
                            )
                          ],
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 0, right: 0, top: 15),
                              child: Container(
                                height: 154,
                                width: 340,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset(
                                    events[index].imageUrl,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 10, left: 15, top: 10),
                              child: Row(
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 20,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Event',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    height: 20,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: Colors.cyan.shade500,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      'Berbayar',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, top: 9),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  events[index].title,
                                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, top: 7),
                              child: Row(
                                children: [
                                  Text(
                                    'From IDR 79K | ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey
                                    ),
                                  ),
                                  Icon(
                                    Icons.add_location_rounded,
                                    size: 12,
                                  ),
                                  Text(
                                    events[index].location,
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey
                                    ),
                                  ),
                                  SizedBox(
                                    width: 144,
                                  ),
                                  Container(
                                    height: 15,
                                    width: 15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Colors.amber
                                    ),
                                    child: Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      size: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return Container(); // Return an empty container if event doesn't match the search term
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}