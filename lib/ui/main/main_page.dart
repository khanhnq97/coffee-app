// Import libraries
import 'package:coffee_app/ui/basket/basket_page.dart';
import 'package:coffee_app/ui/location/location_page.dart';
import 'package:coffee_app/ui/orders/orders_page.dart';
import 'package:coffee_app/ui/profile/profile_page.dart';
import 'package:coffee_app/ui/shop/shop_page.dart';
import 'package:flutter/material.dart';

// Create icons for each tab
const locationIcon = Icon(Icons.location_on);
const shopIcon = Icon(Icons.store);
const ordersIcon = Icon(Icons.list_alt);
const basketIcon = Icon(Icons.shopping_basket);
const profileIcon = Icon(Icons.person);

// Create colors for each tab (optional)
const locationColor = Colors.blue;
const shopColor = Colors.orange;
const ordersColor = Colors.yellow;
const basketColor = Colors.red;
const profileColor = Colors.grey;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0; // Track selected tab index

  // List of widgets to display in each tab
  final List<Widget> _pages = [
    LocationPage(), // Replace with your LocationScreen widget
    ShopPage(), // Replace with your ShopScreen widget
    OrderPage(), // Replace with your OrdersScreen widget
    BasketPage(), // Replace with your BasketScreen widget
    ProfilePage(), // Replace with your ProfileScreen widget
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display current page based on index
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue,
        // Customize selected item color
        unselectedItemColor: Colors.grey,
        // Customize unselected item color
        currentIndex: _selectedIndex,
        // Set current selected index
        onTap: _onItemTapped,
        // Assign on tap callback
        items: const [
          BottomNavigationBarItem(icon: locationIcon, label: 'Location'),
          BottomNavigationBarItem(icon: shopIcon, label: 'Shop'),
          BottomNavigationBarItem(icon: ordersIcon, label: 'Orders'),
          BottomNavigationBarItem(icon: basketIcon, label: 'Basket'),
          BottomNavigationBarItem(icon: profileIcon, label: 'Profile'),
        ],
      ),
    );
  }
}
