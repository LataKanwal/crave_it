import 'package:crave_it/screens/payment_option_screen.dart';
import 'package:flutter/material.dart';

class ShoppingBagScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Burger King',
      'price': 200,
      'quantity': 1,
      'imagePath': 'assets/images/burger_king.jpg',
    },
    {
      'name': 'Subway Sandwich',
      'price': 150,
      'quantity': 2,
      'imagePath': 'assets/images/salad.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(0, (sum, item) => sum + (item['price'] * item['quantity']));

    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Bag'),
        backgroundColor: Color(0xDD7A343D),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: ListTile(
                    leading: Image.asset(
                      item['imagePath'],
                      fit: BoxFit.cover,
                      width: 70,
                    ),
                    title: Text(
                      item['name'],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text('Price: INR ${item['price']} x ${item['quantity']}'),
                    trailing: Text('Total: INR ${item['price'] * item['quantity']}'),
                  ),
                );
              },
            ),
          ),
          _buildCheckoutSection(context, totalPrice),
        ],
      ),
    );
  }

  Widget _buildCheckoutSection(BuildContext context, double totalPrice) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Price',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'INR $totalPrice',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 15),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PaymentOptionsScreen(totalPrice: totalPrice),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xDD7A343D), // Use backgroundColor instead of primary
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text(
                'Proceed to Checkout',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
