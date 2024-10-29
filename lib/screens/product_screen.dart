import 'package:flutter/material.dart';
import 'package:crave_it/screens/shopping_bag_screen.dart'; // Import your ShoppingBagScreen

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int _quantity = 1;
  String _selectedBun = "Brown"; // Default selection
  String _specialInstructions = "";
  bool _isAddedToCart = false; // Track if item is added to cart

  void _increaseQuantity() {
    setState(() {
      _quantity++;
    });
  }

  void _decreaseQuantity() {
    setState(() {
      if (_quantity > 1) {
        _quantity--;
      }
    });
  }

  void _addToCart() {
    // Logic to add the product to the cart
    String productName = "Cricket Deal 2";
    double price = 549.00;
    String instructions = _specialInstructions;

    // You can implement your logic for adding this item to the cart state or a cart provider.

    setState(() {
      _isAddedToCart = true; // Mark item as added to the cart
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('$productName added to cart!'),
    ));
  }

  void _goToCart() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShoppingBagScreen(), // Navigate to ShoppingBagScreen
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage("assets/images/burger3.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 30),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.close,
                      color: Color(0xDD7A343D),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Cricket Deal 2",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    "Rs. 869.00",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                  Text(
                    "Rs. 549.00",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Text(
            "Veggie cheesy burger with lettuce",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          Divider(height: 40, color: Colors.black12),
          SizedBox(height: 10),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xDD7A343D).withOpacity(0.07),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.black26,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Choose your bun",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                      decoration: BoxDecoration(
                        color: Color(0xDD7A343D),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        "Required",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  "Select One",
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    color: Color(0xDD7A343D),
                  ),
                ),
                SizedBox(height: 8),
                RadioListTile(
                  value: "Brown",
                  groupValue: _selectedBun,
                  title: Text("Brown"),
                  secondary: Text("Free"),
                  activeColor: Color(0xDD7A343D),
                  onChanged: (value) {
                    setState(() {
                      _selectedBun = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  value: "White",
                  groupValue: _selectedBun,
                  title: Text("White"),
                  secondary: Text("Free"),
                  activeColor: Color(0xDD7A343D),
                  onChanged: (value) {
                    setState(() {
                      _selectedBun = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  value: "Multigrain",
                  groupValue: _selectedBun,
                  title: Text("Multigrain"),
                  secondary: Text("Free"),
                  activeColor: Color(0xDD7A343D),
                  onChanged: (value) {
                    setState(() {
                      _selectedBun = value.toString();
                    });
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          Text(
            "Special instructions",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 5),
          TextField(
            maxLines: 4,
            onChanged: (value) {
              _specialInstructions = value; // Update special instructions
            },
            decoration: InputDecoration(
              hintText: 'e.g. less sauce',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: EdgeInsets.all(12),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.only(right: 10),
              child: Text(
                "${_specialInstructions.length}/500",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
      bottomNavigationBar: Container(
        height: 90,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1,
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: _decreaseQuantity,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.remove, color: Color(0xDD7A343D), size: 30),
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  "$_quantity",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 20),
                GestureDetector(
                  onTap: _increaseQuantity,
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      color: Color(0xDD7A343D),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 30),
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: _isAddedToCart ? _goToCart : _addToCart, // If already added, go to cart
              child: Container(
                width: MediaQuery.of(context).size.width / 2,
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: Color(0xDD7A343D),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    _isAddedToCart ? "Go to Cart" : "Add to Cart", // Change button text
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
