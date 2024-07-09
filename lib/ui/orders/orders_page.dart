import 'package:flutter/material.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text('ACTIVE', style: TextStyle(color: Colors.grey)),
          ),
          OrderCard(
            orderNumber: '1234',
            items: [
              OrderItem(name: 'Flat white (small) 1 x Whole', price: 12.00),
              OrderItem(name: 'Croissant', price: 3.00),
            ],
            readyTime: '12:00 AM',
          ),
          const Divider(),
          const ListTile(
            title: Text('YESTERDAY', style: TextStyle(color: Colors.grey)),
          ),
          OrderCard(
            orderNumber: '1233',
            items: [
              OrderItem(name: 'Flat white (small) 1 x Whole', price: 12.00),
              OrderItem(name: 'Croissant', price: 3.00),
            ],
            isComplete: true,
          ),
        ],
      ),
    );
  }
}

class OrderCard extends StatelessWidget {
  final String orderNumber;
  final List<OrderItem> items;
  final String? readyTime;
  final bool isComplete;

  const OrderCard({
    super.key,
    required this.orderNumber,
    required this.items,
    this.readyTime,
    this.isComplete = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Text('Order #$orderNumber')),
            ...items.map((item) => OrderItemWidget(item: item)),
            if (readyTime != null)
              Text('Will be ready $readyTime')
            else
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Order again'),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class OrderItem {
  final String name;
  final double price;

  OrderItem({required this.name, required this.price});
}

class OrderItemWidget extends StatelessWidget {
  final OrderItem item;

  const OrderItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('1 x ${item.name}'),
        Text('\$${item.price.toStringAsFixed(2)}'),
      ],
    );
  }
}
