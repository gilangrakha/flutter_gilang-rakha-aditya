import 'package:ecommerce_shop/pages/main_home_page.dart';
import 'package:ecommerce_shop/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_shop/helper/api_service.dart';
import 'dart:math';

class RecommendationPage extends StatefulWidget {
  @override
  _RecommendationPageState createState() => _RecommendationPageState();
}

class _RecommendationPageState extends State<RecommendationPage> {
  List<Map<String, dynamic>> recommendedMenus = [];

  @override
  void initState() {
    super.initState();
    selectRandomMenus();
  }

  void selectRandomMenus() {
    final random = Random();
    final menuCount = ApiService.foodData.length;

    // Ensure that there are at least 3 menus in the API response
    if (menuCount >= 3) {
      recommendedMenus.clear();

      while (recommendedMenus.length < 3) {
        final randomIndex = random.nextInt(menuCount);
        final selectedMenu = ApiService.foodData[randomIndex];
        recommendedMenus.add(selectedMenu);
      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Our Best Seller!', style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),), centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            final recommendedMenu = recommendedMenus[index];
            return ProductItem(
              imagePath: recommendedMenu['images'][0]['sm'],
              title: recommendedMenu['name'],
              description: recommendedMenu['desc'],
              price: 10.00, // You can set your own price here
            );
          },
        ),
      ),
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
                      color: Colors.black,
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
                    child: Icon(Icons.star, color: Colors.grey,),
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
      
    );
  }
}
