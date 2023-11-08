import 'package:ecommerce_shop/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double price;

  const ProductItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: 185,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(imagePath),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Food', style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                )),
                const SizedBox(height: 5),
                Text(description, style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                )),
                const SizedBox(height: 10),
                Text('\$$price', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xff2A977D),
                ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  List<Map<String, dynamic>> foodData = [];

  @override
  void initState() {
    super.initState();
    fetchFoodData().then((data) {
      setState(() {
        foodData = data;
      });
    });
  }

  Future<List<Map<String, dynamic>>> fetchFoodData() async {
    final response = await http.get(
      Uri.parse('https://burgers-hub.p.rapidapi.com/burgers'),
      headers: {
        'X-RapidAPI-Key': 'd5eaf7276fmshd3d34c051ae7608p18e432jsna11b3af7f3d0',
        'X-RapidAPI-Host': 'burgers-hub.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.cast<Map<String, dynamic>>();
    } else {
      throw Exception('Failed to load food data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            bottomNavigationBar: BottomAppBar(
        height: 80,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  // Update the onPressed logic for the Home icon
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MainHomePage(),
                        ),
                      );
                    },
                    child: Icon(
                      Icons.home_filled,
                      color: Color(0xff2A977D),
                    ),
                  ),
                  SizedBox(height: 3),
                  Text('Home'),
                ],
              ),
              Column(
                children: [
                  
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => MainHomePage(),
                        ),
                      );
                    },
                    child: Icon(Icons.shopify),
                  ),
                  SizedBox(height: 3),
                  Text('Cart'),
                ],
              ),
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ProfileScreen(
                          ),
                        ),
                      );
                    },
                    child: Icon(Icons.person),
                  ),
                  SizedBox(height: 3),
                  Text('Account'),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xfFE9EBEA),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 18, right: 10),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 280,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search, size: 35, color: Colors.grey),
                          hintText: 'Mau makan apa?',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Badge(
                  label: Text('1'),
                  child: Image(
                    height: 30,
                    width: 30,
                    image: AssetImage('assets/icons/img.png'),
                  ),
                ),
                const SizedBox(width: 10),
                const Badge(
                  label: Text('9+'),
                  child: Image(
                    height: 30,
                    width: 30,
                    image: AssetImage('assets/icons/chat.png'),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            width: 500,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/main.png'),
              ),
            ),
          ),
          Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 25, right: 18),
          child: Row(
            children: const [
              Text('Best Sale Product', style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(
                width: 130,
              ),
              Text('See more', style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xff2A977D),
              ),)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
          child: Column(
            children: [
              // Use foodData to display food items
              Column(
                children: foodData.map((food) {
                  return ProductItem(
                    imagePath: food['images'][0]['sm'],
                    title: food['name'],
                    description: food['desc'],
                    price: 10.00,  // You can set your own price here
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        // Add more ProductItem widgets here...
      ],
    ),
        ],
      ),
    );
  }
}
