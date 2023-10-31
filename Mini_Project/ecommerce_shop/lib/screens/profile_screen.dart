import 'package:ecommerce_shop/login_page.dart';
import 'package:ecommerce_shop/pages/main_home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_shop/models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final username = context.watch<UsernameProvider>().username;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.white,
        elevation: 5,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Hello, ', style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple
              ),),
            Text('Fuders!', style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                color: Colors.deepPurple
              ),),
          ],
        ),
      ),
      backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.person,
                        size: 150,
                        color: Colors.white,
                      ),
                      Text(
                        '$username', 
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text(
                        'Lorem ipsum amet dolor', 
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.white
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 10,),
            Container(
              width: 400,
              height: 500,
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 380,
                        decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: GestureDetector(
                          onTap: (){
                            
                          },
                          child: Center(
                            child: Text(
                              'History',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 380,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            showLogoutConfirmationDialog(context);
                          },
                          child: Center(
                            child: Text(
                              'Log Out',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
          ],
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
                          builder: (context) => ProfileScreen(),
                        ),
                      );
                    },
                    child: Icon(Icons.person, color: Colors.grey,),
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
  showLogoutConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Log Out Confirmation"),
        content: Text("Are you sure you want to log out?"),
        actions: <Widget>[
          TextButton(
            child: Text("No"),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
            },
          ),
          TextButton(
            child: Text("Yes"),
            onPressed: () {
              // Clear user data and navigate to the login screen
              context.read<UsernameProvider>().clearUserData();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => LoginRegisterPage(),
                ),
              );
            },
          ),
        ],
      );
    },
  );
}

}
