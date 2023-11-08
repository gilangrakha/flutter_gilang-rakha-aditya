import 'package:ecommerce_shop/screens/detail_screen.dart';
import 'package:ecommerce_shop/screens/profile_screen.dart';
import 'package:ecommerce_shop/screens/reccomendation_page.dart';
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
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FoodDetailPage(
            imagePath: imagePath,
            title: title,
            description: description,
            price: price,
          ),
        ));
      },
      child: Container(
        height: 400,
        width: 330,
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
                  Text(title, style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
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
                          builder: (context) => RecommendationPage(),
                        ),
                      );
                    },
                    child: Icon(Icons.star),
                  ),
                  SizedBox(height: 3),
                  Text('Our Best'),
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
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15.0, left: 18, right: 10),
            child: Row(
              children: [
                Container(
                  height: 60,
                  width: 370,
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
              Text('Best Burger', style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(
                width: 180,
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
              // Separate each ProductItem with padding
              Column(
                children: foodData.map((food) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ProductItem(
                      imagePath: food['images'][0]['sm'],
                      title: food['name'],
                      description: food['desc'],
                      price: 10.00,  // You can set your own price here
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        ],
      ),
        ],),
    );
  }
}
