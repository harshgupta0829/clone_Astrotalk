import 'package:flutter/material.dart';
import 'package:new_astroltalk_ui/widgets/AstrologerCard.dart';

class ChatCallPage extends StatelessWidget {
  final String type; // 'chat' or 'call'

  const ChatCallPage({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Mock data for astrologers
    final List<Map<String, dynamic>> astrologers = [
      {
        'name': 'Yash',
        'image':
            'https://ui-avatars.com/api/?name=Yash&background=E0E0E0&color=333333&size=96',
        'expertise': ['Tarot', 'Numerology', 'Loshu Grid'],
        'languages': ['Hindi', 'Punjabi'],
        'experience': 7,
        'rating': 4.5,
        'orders': 4526,
        'price': 24,
        'status': 'available',
        'verified': true,
      },
      {
        'name': 'Shayank',
        'image':
            'https://ui-avatars.com/api/?name=Shayank&background=E0E0E0&color=333333&size=96',
        'expertise': ['Vedic', 'Numerology', 'Nadi'],
        'languages': ['Hindi'],
        'experience': 3,
        'rating': 4.0,
        'orders': 4023,
        'price': 17,
        'status': 'busy',
        'wait': 3,
        'verified': true,
      },
      {
        'name': 'Srijen',
        'image':
            'https://ui-avatars.com/api/?name=Srijen&background=E0E0E0&color=333333&size=96',
        'expertise': ['Numerology', 'Tarot', 'Vedic'],
        'languages': ['Hindi'],
        'experience': 7,
        'rating': 4.5,
        'orders': 16159,
        'price': 28,
        'status': 'busy',
        'wait': 2,
        'verified': true,
      },
      {
        'name': 'Surbhikashi',
        'image':
            'https://ui-avatars.com/api/?name=Surbhi&background=E0E0E0&color=333333&size=96',
        'expertise': ['Tarot'],
        'languages': ['Hindi'],
        'experience': 3,
        'rating': 5.0,
        'orders': 7833,
        'price': 21,
        'status': 'available',
        'verified': true,
      },
      {
        'name': 'Tanuja',
        'image':
            'https://ui-avatars.com/api/?name=Tanuja&background=E0E0E0&color=333333&size=96',
        'expertise': ['Tarot', 'Psychic'],
        'languages': ['Hindi', 'English'],
        'experience': 5,
        'rating': 4.8,
        'orders': 11462,
        'price': 30,
        'status': 'available',
        'verified': true,
      },
      {
        'name': 'Rams',
        'image':
            'https://ui-avatars.com/api/?name=Rams&background=E0E0E0&color=333333&size=96',
        'expertise': ['Vedic', 'Vastu', 'KP'],
        'languages': ['Hindi', 'Punjabi', 'Gujarati'],
        'experience': 6,
        'rating': 4.7,
        'orders': 44676,
        'price': 35,
        'status': 'busy',
        'wait': 4,
        'verified': true,
      },
    ];

    return Column(
      children: [
        // Promotional Banner
        Container(
          height: screenWidth * 0.25, // Responsive height
          margin: const EdgeInsets.only(
            top: 16.0,
            bottom: 16.0,
            left: 16.0,
            right: 16.0,
          ),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.yellow[100],
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  type == 'chat'
                      ? 'When will I find my true love?'
                      : 'Will I have love or arranged marriage?',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Image.network(
                'https://robohash.org/user profile human',
                width: screenWidth * 0.2, // Responsive width
                height: screenWidth * 0.2, // Responsive height
                fit: BoxFit.contain,
                errorBuilder:
                    (context, error, stackTrace) => Container(
                      color: Colors.grey[300],
                      width: screenWidth * 0.2,
                      height: screenWidth * 0.2,
                      child: const Icon(
                        Icons.question_mark,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    width: screenWidth * 0.2,
                    height: screenWidth * 0.2,
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
            ],
          ),
        ),

        // Filter and Sort Options
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _buildFilterButton(Icons.filter_list, 'Filter', Colors.grey),
                const SizedBox(width: 8),
                _buildFilterButton(Icons.grid_view, 'All', Colors.yellow[700]!),
                const SizedBox(width: 8),
                _buildFilterButton(Icons.favorite_border, 'Love', Colors.grey),
                const SizedBox(width: 8),
                _buildFilterButton(Icons.percent, 'Offer', Colors.grey),
                const SizedBox(width: 8),
                _buildFilterButton(
                  Icons.school_outlined,
                  'Category',
                  Colors.grey,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Astrologer List
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            itemCount: astrologers.length,
            itemBuilder: (context, index) {
              return AstrologerCard(astrologer: astrologers[index], type: type);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilterButton(IconData icon, String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: color),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(color: color, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
