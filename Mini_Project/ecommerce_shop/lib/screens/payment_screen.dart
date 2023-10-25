import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  List<String> items = ["e-Wallet", "Debit Card"];
  String selectedPaymentMethod = "e-Wallet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.arrow_back_ios, size: 30),
                  ),
                  // Your favorite, share, shopping bag icons here
                  // ...
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: DropdownButton<String>(
                value: selectedPaymentMethod,
                items: items.map((String item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(item),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedPaymentMethod = newValue!;
                  });
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: const [
                        Text('Total Price'),
                        Text('\$18.00', style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff2A977D),
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50,
                    width: 350,
                    decoration: BoxDecoration(
                      color: Color(0xff2A977D),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: InkWell(
                      onTap: () {
                        // Perform payment and return to the previous screen
                        Navigator.pop(context);
                      },
                      child: const Center(
                        child: Text('Pay Now', style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                        ),),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
