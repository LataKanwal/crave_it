import 'package:crave_it/screens/auth_screen.dart'; // Import AuthScreen
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MyDrawer extends StatelessWidget {
  ListTile listTile(BuildContext context, String text, IconData? icon, VoidCallback onTap) {
    return icon == null
        ? ListTile(
      onTap: onTap,
      title: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      ),
    )
        : ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        color: Color(0xDD7A343D),
      ),
      title: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
        ),
      ),
    );
  }

  // Sign out method
  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // After sign out, navigate to AuthScreen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AuthScreen()),
      );
    } catch (e) {
      print('Sign out error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Sign out failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          Builder(builder: (c) {
            return DrawerHeader(
              decoration: BoxDecoration(
                  color: Color(0xDD7A343D),
                  border: Border.all(
                    color: Color(0xDD7A343D),
                  )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        "L",
                        style: TextStyle(
                          color: Color(0xDD7A343D),
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Lata Kanwal",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            );
          }),
          Column(
            children: [
              listTile(context, "Vouchers & offers", Icons.local_offer_outlined, () {}),
              listTile(context, "Favourites", Icons.favorite_outline_rounded, () {}),
              listTile(context, "Orders & reordering", Icons.my_library_books_outlined, () {}),
              listTile(context, "Addresses", Icons.location_on_outlined, () {}),
              listTile(context, "Payment methods", Icons.payment_rounded, () {}),
              listTile(context, "Help center", Icons.help_center_outlined, () {}),
              listTile(context, "Invite friends", Icons.wallet_giftcard_outlined, () {}),
              Divider(),
              listTile(context, "Settings", null, () {}),
              listTile(context, "Terms & Conditions /Privacy", null, () {}),
              listTile(context, "Logout", null, () {
                // Call the sign out function when "Logout" is tapped
                _signOut(context);
              }),
            ],
          )
        ],
      ),
    );
  }
}
