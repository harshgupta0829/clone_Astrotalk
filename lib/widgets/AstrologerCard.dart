import 'package:flutter/material.dart';

class AstrologerCard extends StatelessWidget {
  final Map<String, dynamic> astrologer;
  final String type; // 'chat' or 'call'

  const AstrologerCard({
    super.key,
    required this.astrologer,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final imageSize =
        screenWidth * 0.22; // Responsive image size for astrologer card

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Astrologer Profile Picture
          Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.yellow[400]!, width: 2),
            ),
            child: ClipOval(
              // Use ClipOval for circular image
              child: Image.network(
                astrologer['image'],
                fit: BoxFit.cover,
                errorBuilder:
                    (context, error, stackTrace) => Container(
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.person,
                        size: 60,
                        color: Colors.grey,
                      ),
                    ),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
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
          ),
          const SizedBox(width: 16),
          // Astrologer Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      astrologer['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    if (astrologer['verified'])
                      const Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 20,
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  astrologer['expertise'].join(', '),
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                Text(
                  astrologer['languages'].join(', '),
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                Text(
                  'Exp- ${astrologer['experience']} Years',
                  style: const TextStyle(fontSize: 13, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < astrologer['rating']
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.yellow[700],
                          size: 16,
                        );
                      }),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${astrologer['orders']} orders',
                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹ ${astrologer['price']} ',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      '5/min',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.red[500],
                      ),
                    ),
                    const Spacer(),
                    astrologer['status'] == 'available'
                        ? ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                type == 'chat'
                                    ? Colors.green[100]
                                    : Colors.yellow[700],
                            foregroundColor:
                                type == 'chat'
                                    ? Colors.green[700]
                                    : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                              side:
                                  type == 'chat'
                                      ? BorderSide(color: Colors.green[500]!)
                                      : BorderSide.none,
                            ),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 10,
                            ),
                          ),
                          child: Text(
                            type == 'chat' ? 'Chat' : 'Call',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        )
                        : OutlinedButton(
                          onPressed: null,
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color:
                                  type == 'chat'
                                      ? Colors.red[400]!
                                      : Colors.grey[400]!,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                          ),
                          child: Text(
                            '${type == 'chat' ? 'Chat' : 'Call'} ~${astrologer['wait']}m',
                            style: TextStyle(
                              color:
                                  type == 'chat'
                                      ? Colors.red[500]
                                      : Colors.grey[500],
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
