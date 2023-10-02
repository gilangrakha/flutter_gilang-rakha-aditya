import 'package:flutter/material.dart';
import 'package:flutter_bloc/models/product.dart';
import 'package:flutter_bloc/screens/cart_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final List<String> cartList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laptop Shop'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartPage(
                    cartList: cartList,
                  ),
                ),
              );
            },
            icon: const Icon(Icons.shopping_cart_rounded),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Contact'),
              onTap: () {
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              title: Text('Gallery'),
              onTap: () {
                Navigator.pushNamed(context, '/gallery');
              },
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
            ),
            ListTile(
              title: Text('Contact Manager'),
              onTap: () {
                Navigator.pushNamed(context, '/contact_manager');
              },
            ),
            ListTile(
              title: Text('About'),
              onTap: () {
                Navigator.pushNamed(context, '/about');
              },
            ),
            ListTile(
              title: Text('Shop'),
              onTap: () {
                Navigator.pushNamed(context, '/shop');
              },
            ),
          ],
        ),
      ),
      body: ProductList(
        cartList: cartList,
      ),
    );
  }
}

class ProductList extends StatefulWidget {
  const ProductList({
    Key? key,
    required this.cartList,
  }) : super(key: key);

  final List<String> cartList;

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  Widget build(BuildContext context) {
    final List<String> productList = Product().productList;
    return Container(
      padding: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
        ),
        itemBuilder: (context, index) {
          return ProductCards(
            productName: productList[index],
            isAdded: widget.cartList.contains(productList[index]),
            onTap: () {
              setState(() {
                widget.cartList.add(productList[index]);
              });
            },
          );
        },
      ),
    );
  }
}

class ProductCards extends StatelessWidget {
  const ProductCards({
    Key? key,
    required this.productName,
    required this.isAdded,
    required this.onTap,
  }) : super(key: key);
  final String productName;
  final bool isAdded;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Image.network(
              'https://picsum.photos/id/0/400/300',
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      productName,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                  IconButton(
                    onPressed: onTap,
                    icon: isAdded
                        ? Icon(
                            Icons.shopping_cart,
                            color: Colors.yellow[900],
                          )
                        : const Icon(Icons.shopping_cart),
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
