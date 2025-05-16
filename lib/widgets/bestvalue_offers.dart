import 'package:flutter/material.dart';

class BestValueOffers extends StatelessWidget {
  const BestValueOffers({super.key});

  final List<Map<String, String>> destinations = const [
    {'city': 'Orlando', 'image': 'assets/images/B1.png'},
    {'city': 'Paris', 'image': 'assets/images/B2.png'},
    {'city': 'Cancun', 'image': 'assets/images/B3.png'},
    {'city': 'Las Vegas', 'image': 'assets/images/B4.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: const Color(0xFFF5F5F5), // fondo gris
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Best Value Offers',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Experience the perfect hotel deal with our unbeatable blend of quality, affordability, and combine it with your favourite events.',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 16),
          ...destinations.map((item) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Image.asset(
                      item['image']!,
                      height: 160,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        item['city']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
