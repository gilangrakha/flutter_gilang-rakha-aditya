import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({
    Key? key,
    required this.cartList,
  }) : super(key: key);

  final List<String> cartList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart Page'),
      ),
      body: Container(
        color: Colors.orange.withOpacity(0.5),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      cartList[index],
                      style: const TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Buy',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
