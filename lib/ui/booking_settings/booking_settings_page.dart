import 'package:flutter/material.dart';

class BookingSettingsPage extends StatefulWidget {
  const BookingSettingsPage({super.key});

  static void navigateToBookingSettingsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BookingSettingsPage()),
    );
  }

  @override
  BookingSettingsPageState createState() => BookingSettingsPageState();
}

class BookingSettingsPageState extends State<BookingSettingsPage> {
  DateTime selectedDate = DateTime(2020, 9, 25);
  TimeOfDay selectedTime = const TimeOfDay(hour: 10, minute: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back),
        //   onPressed: () {
        //     // Handle back navigation
        //   },
        // ),
        title: const Text('Book a table'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildCalendar(),
              const SizedBox(height: 20),
              _buildDateTimeSelection(),
              const SizedBox(height: 20),
              _buildVenueSection(),
              const SizedBox(height: 20),
              _buildBookingTypeSection(),
              const SizedBox(height: 20),
              _buildNumberOfPeopleSection(),
              const SizedBox(height: 20),
              _buildUntilSection(),
              const SizedBox(height: 40),
              _buildApplyButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendar() {
    // Implement calendar widget
    return Container(
        // Calendar implementation
        );
  }

  Widget _buildDateTimeSelection() {
    return Row(
      children: [
        const Text(
          '25',
          style: TextStyle(fontSize: 48, color: Colors.teal),
        ),
        const SizedBox(width: 16),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Semtember 2020'),
            Text('Thursday'),
          ],
        ),
        const Spacer(),
        ElevatedButton(
          child: const Text('10:00 AM'),
          onPressed: () {
            // Show time picker
          },
        ),
      ],
    );
  }

  Widget _buildVenueSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('VENUE'),
        Row(
          children: [
            Text('2 Leman St, Whitechapel'),
            Spacer(),
            Icon(Icons.edit),
          ],
        ),
      ],
    );
  }

  Widget _buildBookingTypeSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('BOOKING TYPE'),
        Row(
          children: [
            Text('Exclusive hire'),
            Spacer(),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ],
    );
  }

  Widget _buildNumberOfPeopleSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('NUMBER OF PEOPLE'),
        Row(
          children: [
            Text('81 Persons'),
            Spacer(),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ],
    );
  }

  Widget _buildUntilSection() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('UNTIL'),
        Row(
          children: [
            Text('Until close'),
            Spacer(),
            Icon(Icons.unfold_more),
          ],
        ),
      ],
    );
  }

  Widget _buildApplyButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Handle apply action
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text('Apply'),
      ),
    );
  }
}
