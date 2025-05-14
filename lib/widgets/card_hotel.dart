import 'package:flutter/material.dart';

import '../screens/rooms_screen.dart';
import '../utils/colors.dart';

class HotelCard extends StatelessWidget {
  final String hotelName;
  final String imagePath;
  final double price;
  final double totalPrice;
  final String ratingLabel;
  final String refundPolicy;
  final bool isRated;
  final bool showSelectButton; // Nuevo parámetro

  const HotelCard({
    super.key,
    required this.hotelName,
    required this.imagePath,
    required this.price,
    required this.totalPrice,
    required this.ratingLabel,
    required this.refundPolicy,
    this.isRated = false,
    this.showSelectButton = true, // Por defecto se muestra
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hotel image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 160, // Ajusta este valor si quieres otro alto
              fit:
                  BoxFit
                      .cover, // Asegura que la imagen se recorte y ajuste al espacio
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hotel name and price comparison
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      hotelName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text('Other Sites', style: TextStyle(fontSize: 12)),
                        Text(
                          '\$49 USD',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 4),

                // Star rating
                Row(
                  children: List.generate(
                    5,
                    (index) =>
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                  ),
                ),

                const SizedBox(height: 6),

                // Rating label button
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black54),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    ratingLabel,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),

                const SizedBox(height: 6),

                // Price section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ratingLabel,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          '\$$price USD',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '\$$totalPrice USD in total\ntaxes and fees included',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 12),

                // Not Rated
                Row(
                  children: [
                    const Icon(Icons.chat_bubble, color: AppColors.primaryBlue),
                    const SizedBox(width: 6),
                    Text(
                      isRated ? 'Rated' : 'Not Rated',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                //Refund + Select
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.successGreen,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        refundPolicy,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),

                    if (showSelectButton)
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RoomsPage(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text('Select'),
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
