import 'package:coffee_app/ui/product_card/product_card_page.dart';
import 'package:coffee_app/ui/search_procces/search_procces_page.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: const Text('Shop', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onTap: () {
                SearchProcessPage.navigateToSearchProcessPage(context);
              },
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text('RECENT', style: TextStyle(color: Colors.grey)),
                SizedBox(width: 16),
                Chip(label: Text('Coffee (9)')),
                SizedBox(width: 8),
                Chip(label: Text('Croissant (9)')),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildCategoryHeader('COFFEE'),
                _buildProductItem(context, 'Flat white', '16.00', 1),
                _buildProductItem(context, 'Latte', '26.00', 2),
                _buildProductItem(context, 'Flat white', '16.00', 1),
                _buildProductItem(context, 'Latte', '26.00', 2),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryHeader(String title) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    );
  }

  Widget _buildProductItem(BuildContext context, String name, String price, int caffeineLevel) {
    return GestureDetector(
      onTap: () {
        ProductCardPage.navigateToProductCardPage(context);
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                color: Colors.grey[300],
                // Thay thế bằng Image.asset cho hình ảnh thực tế
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    Text('Caffeine ${'●' * caffeineLevel}'),
                  ],
                ),
              ),
              Text('\$$price', style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
