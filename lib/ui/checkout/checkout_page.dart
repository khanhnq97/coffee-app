import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  static void navigateToCheckoutPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CheckoutPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Order'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    'https://www.paypalobjects.com/webstatic/mktg/logo/pp_cc_mark_37x23.jpg',
                    height: 20,
                  ),
                  SizedBox(width: 10),
                  Text('PayPal', style: TextStyle(color: Colors.white)),
                ],
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text('Or pay with card', style: TextStyle(color: Colors.blue)),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email',
                hintText: 'Example@132',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Card information',
                hintText: '1234 1234 1221 4421',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.error, color: Colors.red),
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'MM / YY',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'CVC',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Name on card',
                hintText: '123',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Country region',
                hintText: 'United States',
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'ZIP',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              child: Text('Pay \$39.50'),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
