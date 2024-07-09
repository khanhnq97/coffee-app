import 'package:flutter/material.dart';

class BookingSettingsScreen2 extends StatefulWidget {
  const BookingSettingsScreen2({super.key});

  static void navigateToBookingSettingsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BookingSettingsScreen2()),
    );
  }

  @override
  BookingSettingsScreenState2 createState() => BookingSettingsScreenState2();
}

class BookingSettingsScreenState2 extends State<BookingSettingsScreen2> {
  bool _isEnableBooking = true;
  bool _isEnableMinimumBookingTime = false;
  int _minimumBookingTime = 15;
  bool _isEnableMaximumBookingTime = false;
  int _maximumBookingTime = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile(
              title: const Text('Kích hoạt đặt chỗ'),
              value: _isEnableBooking,
              onChanged: (value) => setState(() => _isEnableBooking = value),
            ),
            const Divider(),
            SwitchListTile(
              title: const Text('Kích hoạt thời gian đặt chỗ tối thiểu'),
              value: _isEnableMinimumBookingTime,
              onChanged: (value) => setState(() => _isEnableMinimumBookingTime = value),
            ),
            if (_isEnableMinimumBookingTime) ...[
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _minimumBookingTime.toString(),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Thời gian tối thiểu (phút)',
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && int.tryParse(value) != null) {
                          setState(() => _minimumBookingTime = int.parse(value));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
            const Divider(),
            SwitchListTile(
              title: const Text('Kích hoạt thời gian đặt chỗ tối đa'),
              value: _isEnableMaximumBookingTime,
              onChanged: (value) => setState(() => _isEnableMaximumBookingTime = value),
            ),
            if (_isEnableMaximumBookingTime) ...[
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      initialValue: _maximumBookingTime.toString(),
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Thời gian tối đa (phút)',
                      ),
                      onChanged: (value) {
                        if (value.isNotEmpty && int.tryParse(value) != null) {
                          setState(() => _maximumBookingTime = int.parse(value));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
