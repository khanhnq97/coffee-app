import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SearchProcessPage extends StatelessWidget {
  const SearchProcessPage({super.key});

  static void navigateToSearchProcessPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SearchProcessPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Shop',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CupertinoSearchTextField(
              placeholder: 'Search',
              placeholderStyle: const TextStyle(color: Colors.grey),
              suffixIcon: const Icon(Icons.mic, color: Colors.grey),
              suffixMode: OverlayVisibilityMode.always,
              onSuffixTap: () {
                // Handle mic tap
              },
              onChanged: (String value) {
                // Handle search
              },
            ),
            const SizedBox(height: 16),
            const Text(
              'SUGGESTIONS',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _buildSuggestionItem('Some text'),
            _buildSuggestionItem('Some text'),
            _buildSuggestionItem('Some text'),
          ],
        ),
      ),
    );
  }

  Widget _buildSuggestionItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
