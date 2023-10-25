import 'package:flutter/material.dart';

import '../screens/detail_screen.dart';

class ProductItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double rating;
  final int ratingCount;
  final double price;

  const ProductItem({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.rating,
    required this.ratingCount,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage()));
      },
      child: Container(
        height: 250,
        width: 185,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(
              height: 124,
              image: AssetImage(imagePath),
            ),
            const SizedBox(
              height: 5,
            ),
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
                  const SizedBox(
                    height: 5,
                  ),
                  Text(description, style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.orange),
                      Text('$rating | $ratingCount', style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      )),
                      const SizedBox(
                        width: 3,
                      ),
                      Text('\$$price', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Color(0xff2A977D),
                      ))
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

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
                children: const [
                  Icon(Icons.home_filled,color: Color(0xff2A977D),),
                  SizedBox(height: 3,),
                  Text('Home')
                ],
              ),
              Column(
                children: const [
                  Icon(Icons.add_card_rounded),
                  SizedBox(height: 3,),
                  Text('Voucer')
                ],
              ),
              Column(
                children: const [
                  Icon(Icons.shopify),
                  SizedBox(height: 3,),
                  Text('Cart')
                ],
              ),
              Column(
                children: const [
                  Icon(Icons.person),
                  SizedBox(height: 3,),
                  Text('Account')
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
                  height: 50,
                  width: 280,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search, size: 40, color: Colors.grey),
                      hintText: 'Search..',
                      hintStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
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
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProductItem(
                            imagePath: 'assets/images/food1.png',
                            title: 'Food',
                            description: "Fried Chicken with Chili Sauce",
                            rating: 4.9,
                            ratingCount: 2336,
                            price: 12.00,
                          ),
                          const SizedBox(width: 15),
                          ProductItem(
                            imagePath: 'assets/images/food1.png',
                            title: 'Food',
                            description: "Fried Rice with Pickeld Salad",
                            rating: 4.7,
                            ratingCount: 1445,
                            price: 10.00,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProductItem(
                            imagePath: 'assets/images/food1.png',
                            title: 'Food',
                            description: "Fried Chicken with Chili Sauce",
                            rating: 4.9,
                            ratingCount: 2336,
                            price: 12.00,
                          ),
                          const SizedBox(width: 15),
                          ProductItem(
                            imagePath: 'assets/images/food1.png',
                            title: 'Food',
                            description: "Fried Rice with Pickeld Salad",
                            rating: 4.7,
                            ratingCount: 1445,
                            price: 10.00,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ProductItem(
                            imagePath: 'assets/images/food1.png',
                            title: 'Food',
                            description: "Fried Chicken with Chili Sauce",
                            rating: 4.9,
                            ratingCount: 2336,
                            price: 12.00,
                          ),
                          const SizedBox(width: 15),
                          ProductItem(
                            imagePath: 'assets/images/food1.png',
                            title: 'Food',
                            description: "Fried Rice with Pickeld Salad",
                            rating: 4.7,
                            ratingCount: 1445,
                            price: 10.00,
                          ),
                        ],
                      ),
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
