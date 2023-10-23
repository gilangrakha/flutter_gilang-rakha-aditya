import 'package:flutter/material.dart';

class MainHomePage extends StatelessWidget{
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Color(0xfFE9EBEA),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60, left: 20, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search,size: 40,
                      ),
                      hintText: 'Mau Belanja Apa?',
                      hintStyle: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0)
                      )
                    ),
                  ),
                ),
                const SizedBox(width: 10,),
                const Badge(
                  label: Text('1'),
                  child:  Image(
                  height: 30,
                  width: 30,
                  image: AssetImage('assets/icons/img.png',)),
                ),

                const SizedBox(width: 10,),
                const Badge(
                  label: Text('9+'),
                  child:  Image(
                    height: 30,
                    width: 30,
                    image: AssetImage('assets/icons/chat.png',)),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            width: 415,
            decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/main.png',
              )),
            )
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Row(
              children: [
                Container(
                  height: 100,
                  width: 410,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xffF6F6F6),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Container(
                                  child: Icon(Icons.grid_view_outlined,size: 32,)
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text('Category',style: TextStyle(
                                fontSize: 15,
                              ),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xffF6F6F6),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Container(
                                  child: Icon(Icons.location_on,size: 32,)
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text('Around You',style: TextStyle(
                                fontSize: 15,
                              ),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xffF6F6F6),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Container(
                                  child: Icon(Icons.monetization_on_outlined,size: 35,)
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text('Payment',style: TextStyle(
                                fontSize: 15,
                              ),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xffF6F6F6),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Container(
                                  child: Icon(Icons.shopping_cart,size: 35,)
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text('Checkout',style: TextStyle(
                                fontSize: 15,
                              ),)
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xffF6F6F6),
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Container(
                                  child: Icon(Icons.discount_outlined,size: 35,)
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text('Discount',style: TextStyle(
                                fontSize: 15,
                              ),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'FUDS Around You', style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'See More', style: TextStyle(
                    fontSize: 17,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, right: 18, left: 18),
            child: Row(
              children: [
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/food1.png'
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            
                          ]
                        ),
                      ),
                      Text(
                        'Food', style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        'Fried Chicken with Chili Sauce', style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}