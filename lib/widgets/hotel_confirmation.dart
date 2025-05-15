import 'package:flutter/material.dart';

class HotelConfirmationCard extends StatelessWidget {
  final String imageUrl;
  final String hotelName;
  final String ranking;
  final String description;
  final String checkIn;
  final String checkOut;
  final String nights;
  final String bookingInfo;
  final List<String> cancellationPolicy;

  const HotelConfirmationCard({
    super.key,
    required this.imageUrl,
    required this.hotelName,
    required this.ranking,
    required this.description,
    required this.checkIn,
    required this.checkOut,
    required this.nights,
    required this.bookingInfo,
    required this.cancellationPolicy,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen del hotel
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                imageUrl,
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),

            // Nombre y estrellas
            Text(
              hotelName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: List.generate(5, (index) {
                return const Icon(Icons.star, color: Colors.amber, size: 20);
              }),
            ),

            const SizedBox(height: 16),

            // Ranking
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black12),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                ranking,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ),

            const SizedBox(height: 8),
            Text(description),

            const SizedBox(height: 20),

            // Reservation details
            const Text(
              'Reservation details',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Check in: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: checkIn),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Check out: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: checkOut),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Total length of stay: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: nights),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  const TextSpan(
                    text: 'Booking: ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: bookingInfo),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Cancellation Policy
            const Text(
              'Cancellation Policy',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
                  cancellationPolicy
                      .map(
                        (policy) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("• ", style: TextStyle(fontSize: 16)),
                              Expanded(child: Text(policy)),
                            ],
                          ),
                        ),
                      )
                      .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
