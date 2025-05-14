// refund_badge.dart
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class RefundBadge extends StatelessWidget {
  final bool isRefundable;

  const RefundBadge({super.key, required this.isRefundable});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isRefundable ? AppColors.successGreen : AppColors.primaryBlue,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isRefundable ? 'Refundable' : 'Non Refundable',
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
