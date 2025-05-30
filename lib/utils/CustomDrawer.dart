import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
      ),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 60,
                          height: 60,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: ClipOval(
                            child: Image.network(
                              'https://ui-avatars.com/api/?name=SG&background=FFD700&color=000000&size=50',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.person,
                                  color: Colors.black,
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 12), // Adjusted spacing
                        Column(
                          crossAxisAlignment:
                              CrossAxisAlignment.start, // Align text to start
                          children: [
                            const Text(
                              'Satyam',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight:
                                    FontWeight.bold, // Added bold for name
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ), // Spacing between name and phone
                            const Text(
                              '+91-6388102025',
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.edit,
                            size: 18,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          _buildDrawerItem(Icons.home, 'Home', () {}),
          _buildDrawerItem(
            Icons.book_online,
            'Book a Pooja',
            () {},
            isNew: true,
          ),
          _buildDrawerItem(Icons.headset_mic, 'Customer Support Chat', () {}),
          _buildDrawerItem(
            Icons.account_balance_wallet,
            'Wallet Transactions',
            () {},
            trailingText: '₹ 0',
          ),
          _buildDrawerItem(Icons.card_giftcard, 'Redeem Gift Card', () {}),
          _buildDrawerItem(Icons.history, 'Order History', () {}),
          _buildDrawerItem(Icons.healing, 'AstroRemedy', () {}),
          _buildDrawerItem(Icons.chat, 'Chat with Astrologer', () {}),
          _buildDrawerItem(Icons.people_alt, 'My following', () {}),
          _buildDrawerItem(Icons.star, 'Free Services', () {}, isFree: true),
          _buildDrawerItem(Icons.person_add, 'Sign up as Astrologer', () {}),
          _buildDrawerItem(Icons.settings, 'Settings', () {}),
          _buildDrawerItem(Icons.lock, 'Manage my Privacy', () {}),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Also available on',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    _buildSocialIcon(
                      'https://cdn-icons-png.flaticon.com/512/0/747.png',
                      'Apple',
                    ), // Apple
                    _buildSocialIcon(
                      'https://cdn-icons-png.flaticon.com/512/25/25231.png',
                      'Globe',
                    ), // Globe
                    _buildSocialIcon(
                      'https://cdn-icons-png.flaticon.com/512/733/733547.png',
                      'Facebook',
                    ), // Facebook
                    _buildSocialIcon(
                      'https://cdn-icons-png.flaticon.com/512/174/174855.png',
                      'Instagram',
                    ), // Instagram
                    _buildSocialIcon(
                      'https://cdn-icons-png.flaticon.com/512/174/174857.png',
                      'LinkedIn',
                    ), // LinkedIn
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Version 11.2.330',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool isNew = false,
    bool isFree = false,
    String? trailingText,
  }) {
    return ListTile(
      leading: Stack(
        clipBehavior: Clip.none,
        children: [
          Icon(icon, color: Colors.grey[700]),
          if (isNew)
            Positioned(
              top: -5,
              right: -10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'NEW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          if (isFree)
            Positioned(
              top: -5,
              right: -10,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'FREE',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
      trailing:
          trailingText != null
              ? Text(
                trailingText,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              )
              : null,
      onTap: onTap,
    );
  }

  Widget _buildSocialIcon(String imageUrl, String altText) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Image.network(
        imageUrl,
        width: 28,
        height: 28,
        errorBuilder: (context, error, stackTrace) {
          debugPrint('Error loading social icon ($altText): $error');
          return Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: Text(
                altText[0],
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: 28,
            height: 28,
            color: Colors.grey[100],
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
                value:
                    loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
