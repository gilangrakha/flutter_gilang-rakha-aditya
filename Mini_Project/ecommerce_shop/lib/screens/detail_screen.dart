import 'package:ecommerce_shop/screens/payment_screen.dart';
import 'package:flutter/material.dart';

class FoodDetailPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final double price;

  FoodDetailPage({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Image.network(imagePath),
              SizedBox(height: 30),
              Center(
                child: Container(
                  height: 500,
                  width: 370,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 60,
                          width: 335,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15)
                          ),
                          child: Text(title, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white))),
                        SizedBox(height: 20),
                        
                    Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Container(
                          height: 250,
                          width: 170,
                          child: Text(description, style: TextStyle(fontSize: 16, color: Colors.white))),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 250,
                        width: 155,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(15)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Price', style: TextStyle(
                              fontSize: 20, color: Colors.white,
                            ),),
                            SizedBox(
                              height: 5,
                            ),
                            Text('\$${price.toStringAsFixed(2)}', style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold)),
                          ],
                        )),
                    ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(Icons.shopping_cart, ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 50,
                              width: 275,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context)=> PaymentPage())
                                  );
                                },
                                child: Text(
                                  'Go to Payment!',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
