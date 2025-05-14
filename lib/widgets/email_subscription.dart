import 'package:flutter/material.dart';

import '../utils/colors.dart';

class EmailSubscriptionBox extends StatelessWidget {
  const EmailSubscriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.graysection,// Fondo gris
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      child: Column(
        children: [
          const Text(
            'Join our mailing list to receive exclusive deals\nand discover events before they\ngo on sale',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 24),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Your Email',
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Acción de suscripción
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 0,
            ),
            child: const Text('Subscribe'),
          ),
        ],
      ),
    );
  }
}
