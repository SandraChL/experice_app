import 'package:flutter/material.dart';

class PaymentAmountCard extends StatelessWidget {
  final double totalPrice;
  final int nights;
  final double toPayAtHotel;
  final double payNow;

  const PaymentAmountCard({
    super.key,
    required this.totalPrice,
    required this.nights,
    required this.toPayAtHotel,
    required this.payNow,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Payment Amount',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            const Text(
              'Hotel',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            _buildRow('Price total all rooms', '\$${totalPrice.toStringAsFixed(0)}'),
            _buildRow('Nights', nights.toString()),
            _buildRow('To pay at hotel', '\$${toPayAtHotel.toStringAsFixed(0)}'),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pay Now',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '\$${payNow.toStringAsFixed(0)} USD',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value),
        ],
      ),
    );
  }
}
