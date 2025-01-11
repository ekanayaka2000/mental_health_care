import 'package:flutter/material.dart';
import 'savedCard.dart';

class PaymentMethodScreen extends StatefulWidget {
  final Map<String, String>? savedCard;

  PaymentMethodScreen({this.savedCard});

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
        ),
        backgroundColor: Colors.white,
        elevation: 1,
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            if (widget.savedCard != null)
              Card(
                color: Colors.cyanAccent.withOpacity(0.2),
                child: ListTile(
                  leading: Icon(Icons.credit_card, color: Colors.cyan),
                  title: Text(
                    widget.savedCard!['cardNumber']!,
                    style: TextStyle(color: Colors.black),
                  ),
                  subtitle: Text(
                    'Expires ${widget.savedCard!['expiryDate']}',
                  ),
                ),
              ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddCardScreen()),
                );
              },
              child: Card(
                color: Colors.cyanAccent.withOpacity(0.2),
                child: ListTile(
                  leading: Icon(Icons.add, color: Colors.cyan),
                  title: Text(
                    'Add New Card',
                    style: TextStyle(color: Colors.black),
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

class AddCardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextEditingController cardNumberController = TextEditingController();
    final TextEditingController cardHolderNameController = TextEditingController();
    final TextEditingController expiryDateController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Card',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
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
            TextField(
              controller: cardHolderNameController,
              decoration: InputDecoration(
                labelText: 'Card Holder Name',
                filled: true,
                fillColor: Colors.cyanAccent.withOpacity(0.1),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: cardNumberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Card Number',
                filled: true,
                fillColor: Colors.cyanAccent.withOpacity(0.1),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: expiryDateController,
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                labelText: 'Expiry Date (MM/YY)',
                filled: true,
                fillColor: Colors.cyanAccent.withOpacity(0.1),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SavedCardPage(
                        cardNumber: cardNumberController.text,
                        cardHolderName: cardHolderNameController.text,
                        expiryDate: expiryDateController.text,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text(
                  'Save Card',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
