import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static void navigateToProfilePage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProfilePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildCategories(),
            _buildAchievements(),
            _buildJoinButton(),
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage('assets/profile_pic.png'),
          ),
          const SizedBox(height: 8),
          const Text(
            'Alex Banner',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const Text(
            '4 Steps to Free Coffee',
            style: TextStyle(color: Colors.grey),
          ),
          LinearProgressIndicator(
            value: 240 / 500,
            backgroundColor: Colors.grey[800],
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.teal),
          ),
          const Text(
            '240/500 exp',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildCategoryItem('Daily', Icons.coffee, '7/20'),
        _buildCategoryItem('Random', Icons.casino, '3/10'),
        _buildCategoryItem('Boss', Icons.star, '2/5'),
      ],
    );
  }

  Widget _buildCategoryItem(String title, IconData icon, String score) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        Text(title, style: const TextStyle(color: Colors.white)),
        Text(score, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget _buildAchievements() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: const Column(
        children: [
          Text('ACHIEVEMENTS', style: TextStyle(color: Colors.white)),
          Icon(Icons.keyboard_arrow_down, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildJoinButton() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: const Text('Join the game'),
      ),
    );
  }

  Widget _buildBottomSection() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          _buildSectionTitle('LOYALTY SYSTEM'),
          _buildListItem('Gift Cards', Icons.card_giftcard),
          _buildListItem('Bonuses', Icons.stars),
          _buildSectionTitle('SETTING'),
          _buildListItem('Payment Methods', Icons.payment),
          _buildListItem('Sign Out', Icons.exit_to_app),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
    );
  }

  Widget _buildListItem(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
