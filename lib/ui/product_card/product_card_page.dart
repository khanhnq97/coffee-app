import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProductCardPage extends StatefulWidget {
  static void navigateToProductCardPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProductCardPage()),
    );
  }

  const ProductCardPage({super.key});

  @override
  ProductCardPageState createState() => ProductCardPageState();
}

class ProductCardPageState extends State<ProductCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Coffee App'),
        backgroundColor: Colors.brown,
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            CoffeeProductCard(),
            CoffeeSizeSelector(),
            CoffeeBeanSelector(),
            CoffeeRadarChart(),
            CoffeeCustomizationOptions(),
            CroissantCard(),
          ],
        ),
      ),
    );
  }
}

class CoffeeProductCard extends StatelessWidget {
  const CoffeeProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Coffee image on the left
            Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              child: const Center(
                child: Text(
                  'LOGO',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(width: 16),
            // Text content in the middle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Flat white',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    '\$12.00',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'We believe coffee should be as simple complex as you want it to be. Perfect start your day',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            // Favorite icon on the right
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {
                // Add favorite functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeSizeSelector extends StatefulWidget {
  const CoffeeSizeSelector({super.key});

  @override
  CoffeeSizeSelectorState createState() => CoffeeSizeSelectorState();
}

class CoffeeSizeSelectorState extends State<CoffeeSizeSelector> {
  String _selectedSize = 'Medium';

  Widget _buildSizeOption(String size, String volume) {
    bool isSelected = _selectedSize == size;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSize = size;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.coffee,
              color: isSelected ? Colors.white : Colors.black,
              size: 20,
            ),
            const SizedBox(width: 8),
            Text(
              '$size\n$volume',
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SIZE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildSizeOption('Small', '250 ml'),
            _buildSizeOption('Medium', '350 ml'),
            _buildSizeOption('Big', '450 ml'),
          ],
        ),
      ],
    );
  }
}

class CoffeeBeanSelector extends StatefulWidget {
  const CoffeeBeanSelector({super.key});

  @override
  CoffeeBeanSelectorState createState() => CoffeeBeanSelectorState();
}

class CoffeeBeanSelectorState extends State<CoffeeBeanSelector> {
  String _selectedBean = 'Robusta Revival';

  Widget _buildBeanOption(String beanName) {
    bool isSelected = _selectedBean == beanName;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedBean = beanName;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.black : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          beanName,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'CHOOSE BEANS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildBeanOption('Robusta Revival'),
            _buildBeanOption('Arabica Blue Volcano'),
            _buildBeanOption('Swiss Water Decaf'),
          ],
        ),
      ],
    );
  }
}

class CoffeeRadarChart extends StatelessWidget {
  const CoffeeRadarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: RadarChart(
        RadarChartData(
          radarShape: RadarShape.polygon,
          ticksTextStyle: const TextStyle(color: Colors.transparent),
          radarBorderData: const BorderSide(color: Colors.grey),
          gridBorderData: BorderSide(color: Colors.grey.withOpacity(0.3)),
          // titlesData: FlTitlesData(
          //   show: true,
          //   topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          //   bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          //   leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          //   rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          // ),
          dataSets: [
            RadarDataSet(
              fillColor: Colors.blue.withOpacity(0.2),
              borderColor: Colors.blue,
              entryRadius: 2,
              dataEntries: [
                const RadarEntry(value: 0.8), // BALANCE
                const RadarEntry(value: 0.9), // AROMA
                const RadarEntry(value: 0.7), // CREAM
                const RadarEntry(value: 0.95), // ACIDITY
                const RadarEntry(value: 0.85), // BODY
              ],
            ),
          ],
          getTitle: (index, angle) {
            switch (index) {
              case 0:
                return const RadarChartTitle(text: 'BALANCE');
              case 1:
                return const RadarChartTitle(text: 'AROMA');
              case 2:
                return const RadarChartTitle(text: 'CREAM');
              case 3:
                return const RadarChartTitle(text: 'ACIDITY');
              case 4:
                return const RadarChartTitle(text: 'BODY');

              default:
                return const RadarChartTitle(text: '');
            }
          },
        ),
      ),
    );
  }
}

class CoffeeCustomizationOptions extends StatefulWidget {
  const CoffeeCustomizationOptions({super.key});

  @override
  CoffeeCustomizationOptionsState createState() => CoffeeCustomizationOptionsState();
}

class CoffeeCustomizationOptionsState extends State<CoffeeCustomizationOptions> {
  String selectedMilk = 'Whole Milk';
  Map<String, bool> extras = {
    'Vanilla Syrup': false,
    'Caramel Syrup': false,
  };

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildMilkOption(String milk) {
    return RadioListTile<String>(
      title: Text(milk),
      value: milk,
      groupValue: selectedMilk,
      onChanged: (value) {
        setState(() {
          selectedMilk = value!;
        });
      },
      activeColor: Colors.orange,
    );
  }

  Widget _buildExtraOption(String extra) {
    return CheckboxListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(extra),
          const Text('+ \$0.5', style: TextStyle(color: Colors.orange)),
        ],
      ),
      value: extras[extra],
      onChanged: (bool? value) {
        setState(() {
          extras[extra] = value!;
        });
      },
      activeColor: Colors.orange,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('MILK'),
        _buildMilkOption('Whole Milk'),
        _buildMilkOption('Semi Skimmed'),
        _buildSectionTitle('EXTRAS'),
        ...extras.keys.map(_buildExtraOption),
      ],
    );
  }
}

class CroissantCard extends StatelessWidget {
  const CroissantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          //Image.asset('assets/croissant.png', width: 60, height: 60),
          Container(
            height: 60,
            width: 60,
            color: Colors.grey,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'CROISSANT',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    const Text(
                      '\$3.00',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        '-20%',
                        style: TextStyle(color: Colors.red, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text('ADD'),
          ),
        ],
      ),
    );
  }
}
