import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentOptionsScreen extends StatefulWidget {
  final double totalPrice;

  PaymentOptionsScreen({required this.totalPrice});

  @override
  _PaymentOptionsScreenState createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  Razorpay? _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay!.clear(); // clear all listeners
  }

  // A function to start Razorpay payment (includes Google Pay)
  void _startGooglePayPayment() {
    var options = {
      'key': 'rzp_test_QFarBgoy6x8nfA', // Replace with your Razorpay key
      'amount': (widget.totalPrice * 100).toInt(), // Amount in the smallest currency unit
      'name': 'Shopping App',
      'description': 'Payment for items in cart',
      'prefill': {
        'contact': '1234567890',
        'email': 'test@example.com',
      },
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay!.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Handle Razorpay payment success
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment successful: ${response.paymentId}')),
    );
  }

  // Handle Razorpay payment error
  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Payment failed: ${response.message}')),
    );
  }

  // Handle Razorpay external wallet
  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('External wallet selected: ${response.walletName}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Options'),
        backgroundColor: Color(0xDD7A343D),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Select a Payment Method',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  _buildPaymentMethodTile(
                    icon: Icons.account_balance_wallet,
                    color: Colors.blue,
                    title: 'UPI (Google Pay, PhonePe, etc.)',
                    subtitle: 'Pay using UPI apps',
                    onTap: () => _startGooglePayPayment(),
                  ),
                  Divider(),
                  _buildPaymentMethodTile(
                    icon: Icons.credit_card,
                    color: Colors.green,
                    title: 'Credit/Debit Card',
                    subtitle: 'Visa, MasterCard, RuPay',
                    onTap: () {
                      // Handle Credit/Debit Card Payment
                    },
                  ),
                  Divider(),
                  _buildPaymentMethodTile(
                    icon: Icons.account_balance,
                    color: Colors.orange,
                    title: 'Net Banking',
                    subtitle: 'Bank transfers',
                    onTap: () {
                      // Handle Net Banking Payment
                    },
                  ),
                  Divider(),
                  _buildPaymentMethodTile(
                    icon: Icons.account_balance_wallet_rounded,
                    color: Colors.purple,
                    title: 'Wallets (Paytm, Mobikwik)',
                    subtitle: 'Pay with wallets',
                    onTap: () {
                      // Handle Wallet Payment
                    },
                  ),
                ],
              ),
            ),
            _buildTotalPrice(),
            _buildCheckoutButton(),
          ],
        ),
      ),
    );
  }

  // Helper function to build payment method tiles
  Widget _buildPaymentMethodTile({
    required IconData icon,
    required Color color,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: color.withOpacity(0.1),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 18),
      onTap: onTap,
    );
  }

  // Helper function to display total price
  Widget _buildTotalPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        'Total: INR ${widget.totalPrice}',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Helper function to build the checkout button
  Widget _buildCheckoutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle Checkout
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xDD7A343D), // Use primary color
          padding: EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          'Proceed to Pay',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
