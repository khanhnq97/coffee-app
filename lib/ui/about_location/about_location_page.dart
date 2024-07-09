import 'package:coffee_app/ui/booking/booking_page.dart';
import 'package:flutter/material.dart';

class AboutLocationPage extends StatelessWidget {
  const AboutLocationPage({super.key});

  static void navigateToAboutLocationPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AboutLocationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('Show Coffee Shop Details'),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => DraggableScrollableSheet(
                initialChildSize: 0.9,
                minChildSize: 0.5,
                maxChildSize: 0.9,
                expand: false,
                builder: (_, controller) => SingleChildScrollView(
                  controller: controller,
                  child: const CoffeeShopBottomSheet(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CoffeeShopBottomSheet extends StatelessWidget {
  const CoffeeShopBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Black Sheep Coffee',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Icon(Icons.star_border),
            ],
          ),
        ),
        const ListTile(
          leading: Icon(Icons.access_time),
          title: Text('Open (Closed at 10:00 PM)'),
        ),
        const ListTile(
          leading: Icon(Icons.location_on),
          title: Text('2 Leman St, Whitechapel'),
          subtitle: Text('15 min'),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'About us',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Serving the first specialty grade robusta beans on the market, Black Sheep Coffee are proud to be more...',
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Gallery',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Events',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
          leading: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('MAY', style: TextStyle(fontSize: 12)),
              Text('12', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          title: const Text('Masterclass'),
          subtitle: const Text('Start at 6:00 PM'),
          trailing: OutlinedButton(
            child: const Text('MORE'),
            onPressed: () {},
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('Shop'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: OutlinedButton(
            onPressed: () {
              BookingPage.navigateToBookingPage(context);
            },
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
            ),
            child: const Text('Book a table'),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
