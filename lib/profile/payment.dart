import 'package:flutter/material.dart';
import 'package:mental_health_care/home_screen/home.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment Method',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Credit & Debit Card',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCardScreen()),
                );
              },
              child: Card(
                color: Colors.cyanAccent,
                child: ListTile(
                  leading: Icon(Icons.add, color: Colors.black),
                  title: Text('Add New Card', style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'More Payment Options',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 10),
            PaymentOptionTile(
              icon: Icons.apple,
              title: 'Apple Pay',
              onTap: () {
                // Handle Apple Pay selection
              },
            ),
            PaymentOptionTile(
              icon: Icons.payment,
              title: 'Paypal',
              onTap: () {
                // Handle Paypal selection
              },
            ),
            PaymentOptionTile(
              icon: Icons.play_circle_filled,
              title: 'Google Play',
              onTap: () {
                // Handle Google Play selection
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOptionTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const PaymentOptionTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Colors.cyanAccent, // Apply the color with opacity
        child: ListTile(
          leading: Icon(icon, color: Colors.black),
          title: Text(title, style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}

class AddCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Card', style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.cyanAccent,
              child: Container(
                padding: EdgeInsets.all(16),
                width: double.infinity,
                height: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('0000 0000 0000 0000', style: TextStyle(fontSize: 18, color: Colors.black , fontWeight: FontWeight.bold)),
                    Spacer(),
                    Text('Card Holder Name', style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold)),
                    Text('Expiry Date 00/00', style: TextStyle(color: Colors.black , fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Card Holder Name',
                filled: true,
                fillColor: Colors.lightBlueAccent.withOpacity(0.2),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Card Number',
                filled: true,
                fillColor: Colors.lightBlueAccent.withOpacity(0.2),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Expiry Date',
                      filled: true,
                      fillColor: Colors.lightBlueAccent.withOpacity(0.2),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'CVV',
                      filled: true,
                      fillColor: Colors.lightBlueAccent.withOpacity(0.2),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to home.dart after pressing the button
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()), // Replace with your HomePage widget
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00BCD4),
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text('Save Card', style: TextStyle(color: Colors.white)),
              ),

            ),
          ],
        ),
      ),
    );
  }
}
