import 'package:coffee_app/ui/take_away/take_away_page.dart';
import 'package:flutter/material.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Basket', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildBasketItem(),
                const Divider(),
                _buildQuantitySelector(),
                _buildExtraItem('BEAN: Robusta Revival', 0.5),
                _buildExtraItem('MILK: Whole Milk', 0.5),
                _buildExtraItem('EXTRAS: Vanilla Syrup', 0.5),
                const SizedBox(height: 16),
                _buildCroissantOffer(context),
                const OrderItemCard(),
              ],
            ),
          ),
          _buildTotalAndButtons(context),
        ],
      ),
    );
  }

  Widget _buildBasketItem() {
    return Row(
      children: [
        //Image.asset('assets/coffee_cup.png', width: 60, height: 60),
        Container(
          height: 60,
          width: 60,
          color: Colors.grey,
        ),
        const SizedBox(width: 16),
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('1 x', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Flat white / Small'),
              Text('\$ 12.00', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const Icon(Icons.delete_outline),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        const Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold)),
        const Spacer(),
        IconButton(icon: const Icon(Icons.remove), onPressed: () {}),
        const Text('1'),
        IconButton(icon: const Icon(Icons.add), onPressed: () {}),
      ],
    );
  }

  Widget _buildExtraItem(String title, double price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text('1 x \$ ${price.toStringAsFixed(2)}'),
        ],
      ),
    );
  }

  Widget _buildCroissantOffer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          //Image.asset('assets/croissant.png', width: 60, height: 60),
          Container(
            height: 60,
            width: 60,
            color: Colors.grey,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('CROISSANT', style: TextStyle(fontWeight: FontWeight.bold)),
                Row(
                  children: [
                    const Text('\$ 3.00', style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      color: Colors.red[50],
                      child: const Text('-20%', style: TextStyle(color: Colors.red, fontSize: 12)),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showCroissantBottomSheet(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            child: const Text('ADD'),
          ),
        ],
      ),
    );
  }

  Widget _buildTotalAndButtons(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total price', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('\$ 12.00', style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.orange),
                  ),
                  child: const Text('Role the dice'),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    TakeAwayPage.navigateToTakeAwayPage(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: const Text('Buy'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void showCroissantBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        //Image.asset('assets/croissant.png', width: 50, height: 50),
                        Container(
                          height: 50,
                          width: 50,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('CROISSANT', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('\$3.00'),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('SIZE', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSizeButton('Small\n250 gr', true),
                    _buildSizeButton('Medium\n350 gr', false),
                    _buildSizeButton('Big\n450 gr', false),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('EXTRAS', style: TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                _buildExtraItem('Double cheese', true, 0.5),
                _buildExtraItem('Onion', false, 0.5),
                _buildExtraItem('Double tomato', true, 0.5),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    onPressed: () {
                      // Xử lý thêm vào giỏ hàng
                      Navigator.pop(context);
                    },
                    child: const Text('Add Croissant to basket'),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget _buildSizeButton(String label, bool isSelected) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      foregroundColor: isSelected ? Colors.white : Colors.black,
      backgroundColor: isSelected ? Colors.black : Colors.grey[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    ),
    onPressed: () {
      // Xử lý chọn size
    },
    child: Text(label, textAlign: TextAlign.center),
  );
}

Widget _buildExtraItem(String label, bool isChecked, double price) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label, style: TextStyle(color: isChecked ? Colors.orange : Colors.black)),
      Row(
        children: [
          Text('+ \$$price'),
          Checkbox(
            value: isChecked,
            onChanged: (bool? value) {
              // Xử lý chọn extra
            },
            activeColor: Colors.orange,
          ),
        ],
      ),
    ],
  );
}

class OrderItemCard extends StatelessWidget {
  const OrderItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            //Image.asset('assets/croissant.png', width: 60, height: 60),
            Container(
              width: 60,
              height: 60,
              color: Colors.grey,
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Croissant / Small',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text('\$5.00', style: TextStyle(color: Colors.grey[600])),
                  const SizedBox(height: 8),
                  const Text('EXTRAS: Whole Milk', style: TextStyle(fontSize: 12)),
                  Text('1 x \$0.5', style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.grey),
                  onPressed: () {},
                ),
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove, size: 20),
                      onPressed: () {},
                    ),
                    const Text('1', style: TextStyle(fontSize: 16)),
                    IconButton(
                      icon: const Icon(Icons.add, size: 20),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
