import 'package:coffee_app/ui/booking_settings/booking_settings_page.dart';
import 'package:coffee_app/ui/booking_settings/booking_settings_page2.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  static void navigateToBookingPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BookingPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          //Image.asset('assets/black_sheep_coffee.jpg'),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Book a table',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.star_border),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(Icons.access_time, color: Colors.green),
                        SizedBox(width: 8),
                        Text('Open (Closed at 10:00 PM)'),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.grey),
                        SizedBox(width: 8),
                        Text('2 Leman St, Whitechapel • 15 min'),
                      ],
                    ),
                    SizedBox(height: 24),
                    Center(
                      child: Column(
                        children: [
                          Icon(Icons.calendar_today, size: 48, color: Colors.grey),
                          SizedBox(height: 8),
                          Text('No reservations yet'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                BookingSettingsPage.navigateToBookingSettingsPage(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text('Make new reservation'),
            ),
          ),
        ],
      ),
    );
  }
}
