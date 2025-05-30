import 'package:flutter/material.dart';
import 'package:new_astroltalk_ui/widgets/Remedies/RemedyCard.dart';

class RemediesPage extends StatelessWidget {
  const RemediesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Determine crossAxisCount for GridView based on screen width
    int crossAxisCount = 2; // Default for smaller screens
    if (screenWidth > 600) {
      crossAxisCount = 3; // For tablets and larger screens, maybe 3 or 4
    }

    final List<Map<String, dynamic>> remedies = [
      {
        'title': 'Dhan Lakshmi Shree Yantra Pooja',
        'description':
            'VINAYAKA CHATURTHI SPECIAL\nGet blessings of Goddess Lakshmi for wealth, prosperity, and success in your career and business.',
        'price': '₹499',
        'image':
            'https://media.istockphoto.com/id/119388461/photo/girl-holding-crystal-ball.jpg?s=612x612&w=0&k=20&c=H3mUJEoxpH9sqr03OItk-980SW1hXWVz-eUdSVRSSrs=',
        'tag': 'SPECIAL OFFER',
        'button': 'Participate Now',
      },
      {
        'title': 'Bracelets & Pendants',
        'description':
            'Spiritual accessories energized with divine mantras to bring balance, positivity, and protection into your life.',
        'price': '₹1,100',
        'image':
            'https://m.media-amazon.com/images/I/615tegN6vqL._AC_UY1100_.jpg',
        'tag': 'POPULAR',
        'button': 'Shop Now',
      },
      {
        'title': 'E-Pooja',
        'description':
            'Perform sacred rituals from the comfort of your home. Our priests perform your Pooja live for your wellbeing.',
        'price': '₹199',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdIS-gBmhtudhoDj1ZBlufAYLVUQQM9jWY1A&s',
        'tag': 'ONLINE ONLY',
        'button': 'Book E-Pooja',
      },
      {
        'title': 'VIP E-Pooja',
        'description':
            'Premium personalized Pooja experience with priority scheduling, detailed ritual reports, and live video access.',
        'price': '₹1,100',
        'image':
            'https://www.indianfestivaldiary.com/durgapuja/vip_pass/images/vip_pass.jpg',
        'tag': 'HIGHLY RECOMMENDED',
        'button': 'Reserve VIP Slot',
      },
      {
        'title': 'Shani Jayanti Remedies',
        'description':
            'Appease Lord Shani and reduce the malefic effects of Saturn. Special rituals for peace, discipline, and justice.',
        'price': 'Blessings For You',
        'image':
            'https://bejandaruwalla.com/cdn/shop/articles/Shani_Jayanti_Significance_Puja_Vidhi_and_Remedies@2x.jpg?v=1693288591',
        'tag': 'LIMITED TIME',
        'button': 'Perform Remedy',
      },
      {
        'title': 'Rahu Ketu Transit',
        'description':
            'Align your life path with the cosmic changes during the Rahu-Ketu transit. Remedies to reduce negative effects.',
        'price': '₹1,100',
        'image':
            'https://www.prokerala.com/astrology/assets/img/header/rahu-ketu-transit.jpg',
        'tag': 'ASTRO SPECIAL',
        'button': 'Know More',
      },
    ];

    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        top: 16.0,
        bottom: 80.0,
        left: 16.0,
        right: 16.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Banner
          Container(
            margin: const EdgeInsets.only(bottom: 24.0),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Dhan Lakshmi\nShree Yantra Pooja',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'VINAYAKA CHATURTHI SPECIAL',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Get blessings of Goddess Lakshmi for money and success !',
                        style: TextStyle(fontSize: 13, color: Colors.grey),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward, size: 18),
                        label: const Text('Participate Now'),
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
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    'https://assets.ganeshaspeaks.com/wp-content/uploads/2019/09/lakshmi-750-min.webp',
                    width: screenWidth * 0.25, // Responsive width
                    height: screenWidth * 0.25, // Responsive height
                    fit: BoxFit.cover,
                    errorBuilder:
                        (context, error, stackTrace) => Container(
                          color: Colors.grey[300],
                          width: screenWidth * 0.25,
                          height: screenWidth * 0.25,
                          child: const Icon(
                            Icons.broken_image,
                            size: 50,
                            color: Colors.grey,
                          ),
                        ),
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        width: screenWidth * 0.25,
                        height: screenWidth * 0.25,
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
                ),
              ],
            ),
          ),

          // Remedies Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount, // Responsive crossAxisCount

              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.51, // Adjust as needed for card content
            ),
            itemCount: remedies.length,
            itemBuilder: (context, index) {
              return RemedyCard(remedy: remedies[index]);
            },
          ),
        ],
      ),
    );
  }
}
