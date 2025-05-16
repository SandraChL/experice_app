import 'package:flutter/material.dart';

import '../utils/colors.dart';

class SimilarHotelsCarousel extends StatelessWidget {
  const SimilarHotelsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final hotels = [
      {
        'image': 'assets/images/H3.png',
        'name': 'Nomads Enigmatic Hotel & Restaurant Bar',
        'stars': 2,
        'rating': 4.3,
        'reviews': 2137,
        'price': 147,
      },
      {
        'image': 'assets/images/H5.png',
        'name': 'Sunset Beach Hotel',
        'stars': 3,
        'rating': 4.1,
        'reviews': 1843,
        'price': 130,
      },
      {
        'image': 'assets/images/H6.png',
        'name': 'Ocean Paradise Resort',
        'stars': 4,
        'rating': 4.6,
        'reviews': 3210,
        'price': 165,
      },
    ];
    
    return Padding(
      padding: const EdgeInsets.all(16), // Puedes ajustar este valor
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Similar hotels',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 320,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: hotels.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final hotel = hotels[index];
                return Container(
                  width: 260,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        // ignore: deprecated_member_use
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                        child: Image.asset(
                          hotel['image'] as String,
                          height: 140,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              hotel['name'] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                for (
                                  int i = 0;
                                  i <
                                      (int.tryParse(
                                            hotel['stars'].toString(),
                                          ) ??
                                          0);
                                  i++
                                )
                                  const Icon(
                                    Icons.star,
                                    size: 16,
                                    color: Colors.amber,
                                  ),
                              ],
                            ),
                            const SizedBox(height: 6),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryBlue,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    hotel['rating'].toString(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Very Good (${hotel['reviews']})',
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(color: Colors.black87),
                                children: [
                                  const TextSpan(
                                    text: 'From ',
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  const TextSpan(
                                    text: '\$',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' ${hotel['price']} USD',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
