import 'package:flutter/material.dart';

// This is the new AddCashPage widget
class AddCashPage extends StatelessWidget {
  const AddCashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Mock data for the cash options
    final List<Map<String, dynamic>> cashOptions = [
      {'amount': 50, 'extra': '100 % Extra', 'isPopular': false},
      {'amount': 100, 'extra': '100 % Extra', 'isPopular': true},
      {'amount': 200, 'extra': '50 % Extra', 'isPopular': false},
      {'amount': 500, 'extra': '50 % Extra', 'isPopular': false},
      {'amount': 1000, 'extra': '5 % Extra', 'isPopular': false},
      {'amount': 2000, 'extra': '10 % Extra', 'isPopular': false},
      {'amount': 3000, 'extra': '10 % Extra', 'isPopular': false},
      {'amount': 4000, 'extra': '12 % Extra', 'isPopular': false},
      {'amount': 8000, 'extra': '12 % Extra', 'isPopular': false},
      {'amount': 15000, 'extra': '15 % Extra', 'isPopular': false},
      {'amount': 20000, 'extra': '15 % Extra', 'isPopular': false},
      {'amount': 50000, 'extra': '20 % Extra', 'isPopular': false},
      {'amount': 100000, 'extra': '20 % Extra', 'isPopular': false},
    ];

    // Determine crossAxisCount for GridView based on screen width
    int crossAxisCount = 3; // Default for smaller screens
    if (screenWidth > 600) {
      crossAxisCount = 5; // For tablets and larger screens, adjust as needed
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Implement actual back navigation
          },
        ),
        title: const Text(
          'Add money to wallet',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Available Balance section
            const Text(
              'Available balance',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 4),
            const Text(
              '₹ 0.0',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 24),

            // Cash options grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.0, // Adjust as needed for card content
              ),
              itemCount: cashOptions.length,
              itemBuilder: (context, index) {
                final option = cashOptions[index];
                return _buildCashOptionCard(option);
              },
            ),
            const SizedBox(height: 32),

            // Redeem Gift Card section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.network(
                        'https://cdn-icons-png.flaticon.com/512/2906/2906274.png', // Gift card icon
                        width: 30,
                        height: 30,
                        errorBuilder:
                            (context, error, stackTrace) => const Icon(
                              Icons.card_giftcard,
                              size: 30,
                              color: Colors.orange,
                            ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Redeem Gift Card',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow[700],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    child: const Row(
                      children: [
                        Text('Redeem'),
                        Icon(Icons.chevron_right, size: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCashOptionCard(Map<String, dynamic> option) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '₹ ${option['amount']}',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  option['extra'],
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.green[700],
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          if (option['isPopular'])
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.orange[400],
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
                child: const Text(
                  '★ Most Popular',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
