import 'package:coffee_app/ui/checkout/checkout_page.dart';
import 'package:flutter/material.dart';

class TakeAwayPage extends StatefulWidget {
  const TakeAwayPage({super.key});

  // Step 2: Define the navigate function
  static void navigateToTakeAwayPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TakeAwayPage()),
    );
  }

  @override
  TakeAwayPageState createState() => TakeAwayPageState();
}

class TakeAwayPageState extends State<TakeAwayPage> {
  String _selectedTimePeriod = '10 min';
  double _totalPrice = 12.00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Take Away'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Select a time period',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: '5 min',
                        groupValue: _selectedTimePeriod,
                        onChanged: (value) {
                          setState(() {
                            _selectedTimePeriod = value as String;
                            _totalPrice = 10.00;
                          });
                        },
                      ),
                      const Text('5 MIN'),
                      const SizedBox(width: 16.0),
                      Radio(
                        value: '10 min',
                        groupValue: _selectedTimePeriod,
                        onChanged: (value) {
                          setState(() {
                            _selectedTimePeriod = value as String;
                            _totalPrice = 12.00;
                          });
                        },
                      ),
                      const Text('10 MIN'),
                      const SizedBox(width: 16.0),
                      Radio(
                        value: '20 min',
                        groupValue: _selectedTimePeriod,
                        onChanged: (value) {
                          setState(() {
                            _selectedTimePeriod = value as String;
                            _totalPrice = 15.00;
                          });
                        },
                      ),
                      const Text('20 MIN'),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 16.0),
                    child: Text(
                      'YOUR TIME:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _selectedTimePeriod,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total price',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '\$${_totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Proceed to payment
                  CheckoutPage.navigateToCheckoutPage(context);
                },
                child: const Text('Proceed to payment'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
